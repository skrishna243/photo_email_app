class AddEventDateToEventMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :event_members, :event_date, :date
    add_column :event_members, :event_name, :string
  end
end
