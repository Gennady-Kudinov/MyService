require 'rails_helper'

RSpec.describe "brand_ecus/new", type: :view do
  before(:each) do
    assign(:brand_ecu, BrandEcu.new(
      name: "MyString"
    ))
  end

  it "renders new brand_ecu form" do
    render

    assert_select "form[action=?][method=?]", brand_ecus_path, "post" do

      assert_select "input[name=?]", "brand_ecu[name]"
    end
  end
end
