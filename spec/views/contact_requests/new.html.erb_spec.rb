require 'rails_helper'

RSpec.describe "contact_requests/new", type: :view do
  before(:each) do
    assign(:contact_request, ContactRequest.new(
      name: "MyString",
      email: "MyString",
      subject: "MyString",
      message: "MyText"
    ))
  end

  it "renders new contact_request form" do
    render

    assert_select "form[action=?][method=?]", contact_requests_path, "post" do

      assert_select "input[name=?]", "contact_request[name]"

      assert_select "input[name=?]", "contact_request[email]"

      assert_select "input[name=?]", "contact_request[subject]"

      assert_select "textarea[name=?]", "contact_request[message]"
    end
  end
end
