require "benchmark"

def copy_stream(path : String, buffer_size : Int32) : {Int64, Time::Span}
  bytes = 0_i64
  elapsed = Benchmark.measure do
    File.open(path) do |input|
      output = IO::Memory.new
      buffer = Bytes.new(buffer_size)
      while (count = input.read(buffer)) > 0
        output.write(buffer[0, count])
        bytes += count.to_i64
      end
    end
  end
  {bytes, elapsed}
end

path = ARGV.first? || "input.yaml"

[1024, 32 * 1024].each do |buffer_size|
  bytes, elapsed = copy_stream(path, buffer_size)
  puts "buffer=#{buffer_size} bytes=#{bytes} elapsed_ms=#{elapsed.total_milliseconds}"
end
