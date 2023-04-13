class CreateSeniorStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :senior_students do |t|
      t.integer  :school_id
      t.integer  :photographer_user_id
      t.integer  :internal_student_id
      t.string   :first_name
      t.string   :last_name
      t.integer  :online_code
      t.string   :subject_id
      t.string   :phone_number
      t.string   :email
      t.text     :notes
      t.string   :content_type
      t.string   :organiztion
      t.integer  :reference_number
      t.string   :year
      t.string   :grade
      t.string   :group
      t.text     :image_name
      t.string   :yearbook_selection

      t.timestamps
    end
  end
end
