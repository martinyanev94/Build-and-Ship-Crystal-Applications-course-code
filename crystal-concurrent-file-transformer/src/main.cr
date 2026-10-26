record TransformResult, path : String, success : Bool, message : String

INPUT_DIR = "input"
OUTPUT_DIR = "output"
MAX_WORKERS = 2


def output_path(path : String) : String
  File.join(OUTPUT_DIR, File.basename(path))
end

def transform(path : String, output_dir : String) : TransformResult
  content = File.read(path)
  if content.includes?("[fail]")
    return TransformResult.new(path, false, "failure marker found")
  end

  output_path = File.join(output_dir, File.basename(path))
  File.write(output_path, content.upcase)
  TransformResult.new(path, true, output_path)
rescue error : Exception
  TransformResult.new(path, false, error.message || "transformation failed")
end

discovered = Dir.glob(File.join(INPUT_DIR, "*.txt")).sort
if discovered.empty?
  STDERR.puts "no input files found in #{INPUT_DIR}"
  exit 1
end

Dir.mkdir_p(OUTPUT_DIR)
max_workers = MAX_WORKERS
worker_count = discovered.size < max_workers ? discovered.size : max_workers
jobs = Channel(String?).new(worker_count)
results_channel = Channel(TransformResult).new

worker_count.times do
  spawn do
    loop do
      path = jobs.receive
      break if path.nil?
      results_channel.send(transform(path, OUTPUT_DIR))
    end
  end
end

discovered.each { |path| jobs.send(path) }
worker_count.times { jobs.send(nil) }

results = Array(TransformResult).new
discovered.size.times do
  results << results_channel.receive
end

seen_paths = results.map(&.path).uniq
all_paths_reported = discovered.all? { |path| seen_paths.includes?(path) }
outputs_verified = results.all? do |result|
  !result.success || File.exists?(output_path(result.path))
end

results.sort_by!(&.path)
results.each do |result|
  if result.success
    puts "OK #{result.path} -> #{result.message}"
  else
    STDERR.puts "ERROR #{result.path}: #{result.message}"
  end
end

if all_paths_reported && outputs_verified && results.all?(&.success)
  exit 0
else
  STDERR.puts "batch incomplete or failed"
  exit 1
end
