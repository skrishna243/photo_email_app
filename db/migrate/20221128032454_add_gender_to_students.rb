class AddGenderToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :stu_gender, :string
  end
end
