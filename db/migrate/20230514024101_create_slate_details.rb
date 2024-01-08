class CreateSlateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :slate_details do |t|
      t.integer  :slate_id
      t.integer  :photographer_id
      t.string   :sport_name
      t.string   :team_type
      t.string   :season_name
      t.string   :gender_type
      t.string   :staff_type
      t.integer  :image_start
      t.integer  :image_end
      t.integer  :total_count
      t.string   :note
      t.timestamps
    end
  end
end
