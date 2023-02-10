class CreateEventMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :event_members do |t|
      t.string  :student_name
      t.string  :student_email
      t.integer :event_id
      t.integer :photographer_id
      t.timestamps
    end
  end
end
