require 'rails_helper'

RSpec.describe "sw_idents/new", type: :view do
  before(:each) do
    assign(:sw_ident, SwIdent.new(
      name: "MyString"
    ))
  end

  it "renders new sw_ident form" do
    render

    assert_select "form[action=?][method=?]", sw_idents_path, "post" do

      assert_select "input[name=?]", "sw_ident[name]"
    end
  end
end
