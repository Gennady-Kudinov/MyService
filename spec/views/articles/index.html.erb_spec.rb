require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        image: nil,
        name: "Name",
        title: "MyText",
        text: "MyText"
      ),
      Article.create!(
        image: nil,
        name: "Name",
        title: "MyText",
        text: "MyText"
      )
    ])
  end

  it "renders a list of articles" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
