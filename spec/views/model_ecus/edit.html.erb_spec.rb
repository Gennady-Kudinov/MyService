require 'rails_helper'

RSpec.describe "model_ecus/edit", type: :view do
  let(:model_ecu) {
    ModelEcu.create!(
      name: "MyString",
      brand_ecu: nil
    )
  }

  before(:each) do
    assign(:model_ecu, model_ecu)
  end

  it "renders the edit model_ecu form" do
    render

    assert_select "form[action=?][method=?]", model_ecu_path(model_ecu), "post" do

      assert_select "input[name=?]", "model_ecu[name]"

      assert_select "input[name=?]", "model_ecu[brand_ecu_id]"
    end
  end
end
