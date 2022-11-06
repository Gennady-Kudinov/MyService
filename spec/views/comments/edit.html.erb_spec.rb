require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  let(:comment) {
    Comment.create!(
      image: nil,
      author: "MyString",
      body: "MyText",
      articles: nil
    )
  }

  before(:each) do
    assign(:comment, comment)
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(comment), "post" do

      assert_select "input[name=?]", "comment[image]"

      assert_select "input[name=?]", "comment[author]"

      assert_select "textarea[name=?]", "comment[body]"

      assert_select "input[name=?]", "comment[articles_id]"
    end
  end
end
