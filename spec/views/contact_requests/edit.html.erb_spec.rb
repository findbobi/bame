require 'rails_helper'

RSpec.describe "contact_requests/edit", type: :view do
  before(:each) do
    @contact_request = assign(:contact_request, ContactRequest.create!(
      name: "MyString",
      email: "MyString",
      subject: "MyString",
      message: "MyText"
    ))
  end

  it "renders the edit contact_request form" do
    render

    assert_select "form[action=?][method=?]", contact_request_path(@contact_request), "post" do

      assert_select "input[name=?]", "contact_request[name]"

      assert_select "input[name=?]", "contact_request[email]"

      assert_select "input[name=?]", "contact_request[subject]"

      assert_select "textarea[name=?]", "contact_request[message]"
    end
  end
end
