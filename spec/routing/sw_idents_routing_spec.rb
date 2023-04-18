require "rails_helper"

RSpec.describe SwIdentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/sw_idents").to route_to("sw_idents#index")
    end

    it "routes to #new" do
      expect(get: "/sw_idents/new").to route_to("sw_idents#new")
    end

    it "routes to #show" do
      expect(get: "/sw_idents/1").to route_to("sw_idents#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/sw_idents/1/edit").to route_to("sw_idents#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/sw_idents").to route_to("sw_idents#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/sw_idents/1").to route_to("sw_idents#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/sw_idents/1").to route_to("sw_idents#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/sw_idents/1").to route_to("sw_idents#destroy", id: "1")
    end
  end
end
