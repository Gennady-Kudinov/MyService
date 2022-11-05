require 'rails_helper'

RSpec.describe "the_files/new", type: :view do
  before(:each) do
    assign(:the_file, TheFile.new(
      file: nil,
      title: "MyText",
      text: "MyText"
    ))
  end

  it "renders new the_file form" do
    render

    assert_select "form[action=?][method=?]", the_files_path, "post" do

      assert_select "input[name=?]", "the_file[file]"

      assert_select "textarea[name=?]", "the_file[title]"

      assert_select "textarea[name=?]", "the_file[text]"
    end
  end
end
