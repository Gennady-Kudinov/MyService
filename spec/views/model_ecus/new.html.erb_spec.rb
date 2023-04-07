require 'rails_helper'

RSpec.describe "model_ecus/new", type: :view do
  before(:each) do
    assign(:model_ecu, ModelEcu.new(
      name: "MyString",
      brand_ecu: nil
    ))
  end

  it "renders new model_ecu form" do
    render

    assert_select "form[action=?][method=?]", model_ecus_path, "post" do

      assert_select "input[name=?]", "model_ecu[name]"

      assert_select "input[name=?]", "model_ecu[brand_ecu_id]"
    end
  end
end
