require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      image: nil,
      author: "MyString",
      body: "MyText",
      articles: nil
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input[name=?]", "comment[image]"

      assert_select "input[name=?]", "comment[author]"

      assert_select "textarea[name=?]", "comment[body]"

      assert_select "input[name=?]", "comment[articles_id]"
    end
  end
end
