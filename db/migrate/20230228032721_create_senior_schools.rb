class CreateSeniorSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :senior_schools do |t|
      t.string   :school_name
      t.string   :season_name
      t.string   :session_name
      t.integer  :photographer_id
      t.timestamps
    end
  end
end
