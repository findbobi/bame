class BusinessType < ApplicationRecord
  has_many :businesses
  belongs_to :business_group

  validates :name, :business_group, presence: true
end
