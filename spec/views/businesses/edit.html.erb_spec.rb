require 'rails_helper'

RSpec.describe "businesses/edit", type: :view do
  before(:each) do
    @business = assign(:business, Business.create!(
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

  it "renders the edit business form" do
    render

    assert_select "form[action=?][method=?]", business_path(@business), "post" do

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
