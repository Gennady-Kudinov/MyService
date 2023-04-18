require 'rails_helper'

RSpec.describe "sw_idents/index", type: :view do
  before(:each) do
    assign(:sw_idents, [
      SwIdent.create!(
        name: "Name"
      ),
      SwIdent.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of sw_idents" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
