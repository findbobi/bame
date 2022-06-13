require 'rails_helper'

RSpec.describe "businesses/new", type: :view do
  before(:each) do
    assign(:business, Business.new(
      name: "MyString",
      email: "MyString",
      is_owner: false,
      location: "MyString",
      telephone: "MyString",
      website: "MyString",
      instagram: "MyString",
      business_type: nil
    ))
  end

  it "renders new business form" do
    render

    assert_select "form[action=?][method=?]", businesses_path, "post" do

      assert_select "input[name=?]", "business[name]"

      assert_select "input[name=?]", "business[email]"

      assert_select "input[name=?]", "business[is_owner]"

      assert_select "input[name=?]", "business[location]"

      assert_select "input[name=?]", "business[telephone]"

      assert_select "input[name=?]", "business[website]"

      assert_select "input[name=?]", "business[instagram]"

      assert_select "input[name=?]", "business[business_type_id]"
    end
  end
end
