class AddNewDataFieldToStudentChecks < ActiveRecord::Migration[6.0]
  def change
    add_column :senior_student_checks, :new_data, :string
  end
end
