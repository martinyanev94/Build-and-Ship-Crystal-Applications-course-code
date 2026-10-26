require "spec"
require "../src/reading_progress"

describe ReadingProgress do
  it "reports progress after an advance" do
    progress = ReadingProgress.new(10)

    progress.advance(3)

    progress.percentage.should eq 30.0
  end

  it "accepts advancing to the total boundary" do
    progress = ReadingProgress.new(10)

    progress.advance(10)

    progress.percentage.should eq 100.0
  end

  it "rejects an advance past the total" do
    progress = ReadingProgress.new(10)

    expect_raises(ArgumentError, "cannot pass total pages") do
      progress.advance(11)
    end

    progress.completed_pages.should eq 0
  end
end
