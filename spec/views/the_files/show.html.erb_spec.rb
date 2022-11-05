require 'rails_helper'

RSpec.describe "the_files/show", type: :view do
  before(:each) do
    assign(:the_file, TheFile.create!(
      file: nil,
      title: "MyText",
      text: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
