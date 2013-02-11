require "spec_helper"

describe CountryAreasController do
  describe "routing" do

    it "routes to #index" do
      get("/country_areas").should route_to("country_areas#index")
    end

    it "routes to #new" do
      get("/country_areas/new").should route_to("country_areas#new")
    end

    it "routes to #show" do
      get("/country_areas/1").should route_to("country_areas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/country_areas/1/edit").should route_to("country_areas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/country_areas").should route_to("country_areas#create")
    end

    it "routes to #update" do
      put("/country_areas/1").should route_to("country_areas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/country_areas/1").should route_to("country_areas#destroy", :id => "1")
    end

  end
end
