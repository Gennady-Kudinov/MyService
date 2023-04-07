require 'rails_helper'

RSpec.describe "brand_ecus/show", type: :view do
  before(:each) do
    assign(:brand_ecu, BrandEcu.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
