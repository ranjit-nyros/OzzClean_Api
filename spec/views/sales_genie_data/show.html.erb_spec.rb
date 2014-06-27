require 'spec_helper'

describe "sales_genie_data/show" do
  before(:each) do
    @sales_genie_datum = assign(:sales_genie_datum, stub_model(SalesGenieDatum))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
