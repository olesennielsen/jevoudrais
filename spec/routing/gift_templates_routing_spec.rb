require "spec_helper"

describe GiftTemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/gift_templates").should route_to("gift_templates#index")
    end

    it "routes to #new" do
      get("/gift_templates/new").should route_to("gift_templates#new")
    end

    it "routes to #show" do
      get("/gift_templates/1").should route_to("gift_templates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gift_templates/1/edit").should route_to("gift_templates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gift_templates").should route_to("gift_templates#create")
    end

    it "routes to #update" do
      put("/gift_templates/1").should route_to("gift_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gift_templates/1").should route_to("gift_templates#destroy", :id => "1")
    end

  end
end
