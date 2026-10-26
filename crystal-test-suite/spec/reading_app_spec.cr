require "spec"
require "../src/reading_app"

describe "ProgressApp" do
  it "reports progress from input" do
    input = IO::Memory.new("10\n3\n")
    output = IO::Memory.new

    ProgressApp.run(input, output)

    output.rewind
    output.gets.should eq "3/10 pages (30.0%)\n"
  end
end
