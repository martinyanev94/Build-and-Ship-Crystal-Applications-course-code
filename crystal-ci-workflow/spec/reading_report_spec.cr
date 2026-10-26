require "spec"
require "../src/reading_report"

describe ReadingReport do
  it "reports completion as a percentage" do
    ReadingReport.new("Crystal in Practice", 120, 300).completion.should eq 40.0
  end

  it "formats a readable summary" do
    ReadingReport.new("Crystal in Practice", 120, 300).summary.should eq "Crystal in Practice: 40.0% complete"
  end
end
