require 'rails_helper'

RSpec.describe "contact_requests/index", type: :view do
  before(:each) do
    assign(:contact_requests, [
      ContactRequest.create!(
        name: "Name",
        email: "Email",
        subject: "Subject",
        message: "MyText"
      ),
      ContactRequest.create!(
        name: "Name",
        email: "Email",
        subject: "Subject",
        message: "MyText"
      )
    ])
  end

  it "renders a list of contact_requests" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Subject".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
