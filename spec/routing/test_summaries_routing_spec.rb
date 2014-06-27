require "spec_helper"

describe TestSummariesController do
  describe "routing" do

    it "routes to #index" do
      get("/test_summaries").should route_to("test_summaries#index")
    end

    it "routes to #new" do
      get("/test_summaries/new").should route_to("test_summaries#new")
    end

    it "routes to #show" do
      get("/test_summaries/1").should route_to("test_summaries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/test_summaries/1/edit").should route_to("test_summaries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/test_summaries").should route_to("test_summaries#create")
    end

    it "routes to #update" do
      put("/test_summaries/1").should route_to("test_summaries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/test_summaries/1").should route_to("test_summaries#destroy", :id => "1")
    end

  end
end
