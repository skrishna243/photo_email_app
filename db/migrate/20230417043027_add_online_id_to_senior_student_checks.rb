class AddOnlineIdToSeniorStudentChecks < ActiveRecord::Migration[6.0]
  def change
    add_column :senior_student_checks, :student_online_id, :integer
  end
end
