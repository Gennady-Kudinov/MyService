require "rails_helper"

RSpec.describe TheFilesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/the_files").to route_to("the_files#index")
    end

    it "routes to #new" do
      expect(get: "/the_files/new").to route_to("the_files#new")
    end

    it "routes to #show" do
      expect(get: "/the_files/1").to route_to("the_files#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/the_files/1/edit").to route_to("the_files#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/the_files").to route_to("the_files#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/the_files/1").to route_to("the_files#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/the_files/1").to route_to("the_files#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/the_files/1").to route_to("the_files#destroy", id: "1")
    end
  end
end
