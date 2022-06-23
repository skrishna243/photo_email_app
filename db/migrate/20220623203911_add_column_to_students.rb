class AddColumnToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :event_date, :date
  end
end
