class AddBusinessOwnerNameAndTimeFieldsWithBoolean < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :owner_name, :string
    add_column :businesses, :is_online, :boolean
    add_column :businesses, :is_offline, :boolean
    add_column :businesses, :is_open_on_saturday, :boolean
    add_column :businesses, :is_open_on_sunday, :boolean
    add_column :businesses, :saturday_opening_time, :time
    add_column :businesses, :saturday_closing_time, :time
    add_column :businesses, :sunday_opening_time, :time
    add_column :businesses, :sunday_closing_time, :time
  end
end
