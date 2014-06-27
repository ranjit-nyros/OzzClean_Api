require 'spec_helper'

describe "test_summaries/edit" do
  before(:each) do
    @test_summary = assign(:test_summary, stub_model(TestSummary))
  end

  it "renders the edit test_summary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => test_summaries_path(@test_summary), :method => "post" do
    end
  end
end
