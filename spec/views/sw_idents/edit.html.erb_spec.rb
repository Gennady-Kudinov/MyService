require 'rails_helper'

RSpec.describe "sw_idents/edit", type: :view do
  let(:sw_ident) {
    SwIdent.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:sw_ident, sw_ident)
  end

  it "renders the edit sw_ident form" do
    render

    assert_select "form[action=?][method=?]", sw_ident_path(sw_ident), "post" do

      assert_select "input[name=?]", "sw_ident[name]"
    end
  end
end
