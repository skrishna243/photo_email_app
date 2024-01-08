class CreateSlates < ActiveRecord::Migration[6.0]
  def change
    create_table :slates do |t|
      t.string   :school_name
      t.string   :season_name
      t.string   :photographer_name
      t.integer  :photographer_id
      t.timestamps
    end
  end
end
