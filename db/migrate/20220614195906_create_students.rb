class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string  :student_name
      t.string  :student_email
      t.string  :parent_email
      t.string  :type_of_sport
      t.string  :team_type
      t.string  :school_name
      t.string  :season_type
      t.integer :photographer_id
      t.timestamps
    end
  end
end
