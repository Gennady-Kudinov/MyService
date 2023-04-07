require 'rails_helper'

RSpec.describe "brand_ecus/edit", type: :view do
  let(:brand_ecu) {
    BrandEcu.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:brand_ecu, brand_ecu)
  end

  it "renders the edit brand_ecu form" do
    render

    assert_select "form[action=?][method=?]", brand_ecu_path(brand_ecu), "post" do

      assert_select "input[name=?]", "brand_ecu[name]"
    end
  end
end
