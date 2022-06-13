require 'rails_helper'
require 'validate_url/rspec_matcher'

RSpec.describe Business, type: :model do
  it { is_expected.to validate_url_of(:website) }
  it { is_expected.to validate_url_of(:instagram) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:website) }
  it { is_expected.to validate_presence_of(:instagram) }
  it { is_expected.to validate_presence_of(:opens_at) }
  it { is_expected.to validate_presence_of(:closes_at) }
  it { is_expected.to validate_presence_of(:business_type_id) }
  it { is_expected.to validate_presence_of(:telephone) }

  it { should_not allow_value("test").for(:email) }
  it { should allow_value("test@gmail.com").for(:email) }
end
