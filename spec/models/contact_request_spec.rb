require 'rails_helper'

RSpec.describe ContactRequest, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:subject) }
  it { is_expected.to validate_presence_of(:message) }

  it { should_not allow_value("test").for(:email) }
  it { should allow_value("test@gmail.com").for(:email) }
end
