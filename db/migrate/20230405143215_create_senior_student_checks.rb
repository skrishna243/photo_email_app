class CreateSeniorStudentChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :senior_student_checks do |t|
      t.integer  :school_id
      t.integer  :photographer_user_id
      t.integer  :senior_student_id
      t.integer  :internal_student_id
      t.string   :first_name
      t.string   :last_name
      t.string   :subject_id
      t.string   :phone_number
      t.string   :email
      t.string   :check_type
      t.timestamps
    end
  end
end
