require 'spec_helper'

describe "sales_genie_data/edit" do
  before(:each) do
    @sales_genie_datum = assign(:sales_genie_datum, stub_model(SalesGenieDatum))
  end

  it "renders the edit sales_genie_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sales_genie_data_path(@sales_genie_datum), :method => "post" do
    end
  end
end
