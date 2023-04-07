require "rails_helper"

RSpec.describe ModelEcusController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/model_ecus").to route_to("model_ecus#index")
    end

    it "routes to #new" do
      expect(get: "/model_ecus/new").to route_to("model_ecus#new")
    end

    it "routes to #show" do
      expect(get: "/model_ecus/1").to route_to("model_ecus#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/model_ecus/1/edit").to route_to("model_ecus#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/model_ecus").to route_to("model_ecus#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/model_ecus/1").to route_to("model_ecus#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/model_ecus/1").to route_to("model_ecus#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/model_ecus/1").to route_to("model_ecus#destroy", id: "1")
    end
  end
end
