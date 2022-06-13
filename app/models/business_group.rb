class BusinessGroup < ApplicationRecord
  has_many :business_types

  validates :name, presence: true
end
