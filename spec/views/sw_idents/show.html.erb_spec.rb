require 'rails_helper'

RSpec.describe "sw_idents/show", type: :view do
  before(:each) do
    assign(:sw_ident, SwIdent.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
