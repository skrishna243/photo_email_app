class AddEventLocationToEventMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :event_members, :event_location, :string
  end
end
