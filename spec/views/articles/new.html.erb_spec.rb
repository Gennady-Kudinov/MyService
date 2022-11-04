require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      image: nil,
      name: "MyString",
      title: "MyText",
      text: "MyText"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input[name=?]", "article[image]"

      assert_select "input[name=?]", "article[name]"

      assert_select "textarea[name=?]", "article[title]"

      assert_select "textarea[name=?]", "article[text]"
    end
  end
end
