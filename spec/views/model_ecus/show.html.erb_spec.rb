require 'rails_helper'

RSpec.describe "model_ecus/show", type: :view do
  before(:each) do
    assign(:model_ecu, ModelEcu.create!(
      name: "Name",
      brand_ecu: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
