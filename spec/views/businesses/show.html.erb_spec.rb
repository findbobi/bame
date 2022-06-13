require 'rails_helper'

RSpec.describe "businesses/show", type: :view do
  before(:each) do
    @business = assign(:business, Business.create!(
      name: "Name",
      email: "Email",
      is_owner: false,
      location: "Location",
      telephone: "Telephone",
      website: "Website",
      instagram: "Instagram",
      business_type: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Telephone/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Instagram/)
    expect(rendered).to match(//)
  end
end
