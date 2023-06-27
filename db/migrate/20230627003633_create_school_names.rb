class CreateSchoolNames < ActiveRecord::Migration[6.0]
  def change
    create_table :school_names do |t|
      t.string :name
      t.string :school_type
    end
  end
end
