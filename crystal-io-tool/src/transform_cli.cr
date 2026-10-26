require "./transform"

processor = Transform::Processor.new

if filter = ARGV.shift
  processor.process([filter], ARGF, STDOUT, STDERR)
else
  STDERR.puts "usage: transform FILTER [INPUT_FILE]"
  exit 2
end
