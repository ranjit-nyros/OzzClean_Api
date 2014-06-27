require 'spec_helper'

describe "test_summaries/new" do
  before(:each) do
    assign(:test_summary, stub_model(TestSummary).as_new_record)
  end

  it "renders new test_summary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => test_summaries_path, :method => "post" do
    end
  end
end
