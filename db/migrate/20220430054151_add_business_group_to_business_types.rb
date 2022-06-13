class AddBusinessGroupToBusinessTypes < ActiveRecord::Migration[7.0]
  def change
    default_business_group = BusinessGroup.create(name: "Default BusinessGroup")
    add_reference :business_types, :business_group, null: false, foreign_key: true, default: default_business_group.id
  end
end
