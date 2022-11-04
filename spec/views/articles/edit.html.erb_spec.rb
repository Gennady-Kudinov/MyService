require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  let(:article) {
    Article.create!(
      image: nil,
      name: "MyString",
      title: "MyText",
      text: "MyText"
    )
  }

  before(:each) do
    assign(:article, article)
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(article), "post" do

      assert_select "input[name=?]", "article[image]"

      assert_select "input[name=?]", "article[name]"

      assert_select "textarea[name=?]", "article[title]"

      assert_select "textarea[name=?]", "article[text]"
    end
  end
end
