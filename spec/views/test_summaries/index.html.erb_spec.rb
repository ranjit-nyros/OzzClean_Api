require 'spec_helper'

describe "test_summaries/index" do
  before(:each) do
    assign(:test_summaries, [
      stub_model(TestSummary),
      stub_model(TestSummary)
    ])
  end

  it "renders a list of test_summaries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
