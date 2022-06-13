require 'rails_helper'

RSpec.describe "businesses/index", type: :view do
  before(:each) do
    assign(:businesses, [
      Business.create!(
        name: "Name",
        email: "Email",
        is_owner: false,
        location: "Location",
        telephone: "Telephone",
        website: "Website",
        instagram: "Instagram",
        business_type: nil
      ),
      Business.create!(
        name: "Name",
        email: "Email",
        is_owner: false,
        location: "Location",
        telephone: "Telephone",
        website: "Website",
        instagram: "Instagram",
        business_type: nil
      )
    ])
  end

  it "renders a list of businesses" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "Location".to_s, count: 2
    assert_select "tr>td", text: "Telephone".to_s, count: 2
    assert_select "tr>td", text: "Website".to_s, count: 2
    assert_select "tr>td", text: "Instagram".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
