require "rails_helper"

RSpec.describe BrandEcusController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/brand_ecus").to route_to("brand_ecus#index")
    end

    it "routes to #new" do
      expect(get: "/brand_ecus/new").to route_to("brand_ecus#new")
    end

    it "routes to #show" do
      expect(get: "/brand_ecus/1").to route_to("brand_ecus#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/brand_ecus/1/edit").to route_to("brand_ecus#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/brand_ecus").to route_to("brand_ecus#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/brand_ecus/1").to route_to("brand_ecus#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/brand_ecus/1").to route_to("brand_ecus#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/brand_ecus/1").to route_to("brand_ecus#destroy", id: "1")
    end
  end
end
