class AddColumnsToSeniorStudentCheck < ActiveRecord::Migration[6.0]
  def change
    add_column :senior_student_checks, :full_name, :string
    add_column :senior_student_checks, :session_type, :string
  end
end
