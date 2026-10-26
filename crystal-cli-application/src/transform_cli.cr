require "./transform"

filter = ARGV.first

if filter.nil? || filter.empty?
  STDERR.puts "Missing jq filter"
  exit 2
end

unless Transform.run(filter)
  STDERR.puts "The jq filter could not be applied"
  exit 1
end
