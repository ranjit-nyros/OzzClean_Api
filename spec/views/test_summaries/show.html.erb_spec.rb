require 'spec_helper'

describe "test_summaries/show" do
  before(:each) do
    @test_summary = assign(:test_summary, stub_model(TestSummary))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
