require 'rails_helper'

RSpec.describe "the_files/edit", type: :view do
  let(:the_file) {
    TheFile.create!(
      file: nil,
      title: "MyText",
      text: "MyText"
    )
  }

  before(:each) do
    assign(:the_file, the_file)
  end

  it "renders the edit the_file form" do
    render

    assert_select "form[action=?][method=?]", the_file_path(the_file), "post" do

      assert_select "input[name=?]", "the_file[file]"

      assert_select "textarea[name=?]", "the_file[title]"

      assert_select "textarea[name=?]", "the_file[text]"
    end
  end
end
