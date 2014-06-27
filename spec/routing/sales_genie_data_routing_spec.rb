require "spec_helper"

describe SalesGenieDataController do
  describe "routing" do

    it "routes to #index" do
      get("/sales_genie_data").should route_to("sales_genie_data#index")
    end

    it "routes to #new" do
      get("/sales_genie_data/new").should route_to("sales_genie_data#new")
    end

    it "routes to #show" do
      get("/sales_genie_data/1").should route_to("sales_genie_data#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sales_genie_data/1/edit").should route_to("sales_genie_data#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sales_genie_data").should route_to("sales_genie_data#create")
    end

    it "routes to #update" do
      put("/sales_genie_data/1").should route_to("sales_genie_data#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sales_genie_data/1").should route_to("sales_genie_data#destroy", :id => "1")
    end

  end
end
