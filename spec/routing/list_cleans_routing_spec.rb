require "spec_helper"

describe ListCleansController do
  describe "routing" do

    it "routes to #index" do
      get("/list_cleans").should route_to("list_cleans#index")
    end

    it "routes to #new" do
      get("/list_cleans/new").should route_to("list_cleans#new")
    end

    it "routes to #show" do
      get("/list_cleans/1").should route_to("list_cleans#show", :id => "1")
    end

    it "routes to #edit" do
      get("/list_cleans/1/edit").should route_to("list_cleans#edit", :id => "1")
    end

    it "routes to #create" do
      post("/list_cleans").should route_to("list_cleans#create")
    end

    it "routes to #update" do
      put("/list_cleans/1").should route_to("list_cleans#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/list_cleans/1").should route_to("list_cleans#destroy", :id => "1")
    end

  end
end
