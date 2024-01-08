class ChangeStudentOnlineIdToBeStringInSeniorStudentChecks < ActiveRecord::Migration[6.0]
  def change
     change_column :senior_student_checks, :student_online_id, :string
  end
end
