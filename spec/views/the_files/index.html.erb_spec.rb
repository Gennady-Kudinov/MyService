require 'rails_helper'

RSpec.describe "the_files/index", type: :view do
  before(:each) do
    assign(:the_files, [
      TheFile.create!(
        file: nil,
        title: "MyText",
        text: "MyText"
      ),
      TheFile.create!(
        file: nil,
        title: "MyText",
        text: "MyText"
      )
    ])
  end

  it "renders a list of the_files" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
