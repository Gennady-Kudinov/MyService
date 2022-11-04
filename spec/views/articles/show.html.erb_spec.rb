require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    assign(:article, Article.create!(
      image: nil,
      name: "Name",
      title: "MyText",
      text: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
