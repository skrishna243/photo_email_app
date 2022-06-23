class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string   :school_name
      t.string   :season_name
      t.integer  :user_id
      t.timestamps
    end
  end
end
