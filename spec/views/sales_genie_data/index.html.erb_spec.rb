require 'spec_helper'

describe "sales_genie_data/index" do
  before(:each) do
    assign(:sales_genie_data, [
      stub_model(SalesGenieDatum),
      stub_model(SalesGenieDatum)
    ])
  end

  it "renders a list of sales_genie_data" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
