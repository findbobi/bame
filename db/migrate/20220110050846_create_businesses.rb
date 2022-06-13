class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :email
      t.boolean :is_owner, default: true
      t.boolean :is_approved
      t.string :location
      t.string :telephone
      t.string :website
      t.string :instagram
      t.time :opens_at
      t.time :closes_at
      t.belongs_to :business_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
