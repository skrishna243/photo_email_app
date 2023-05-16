class AddFieldsToSlateDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :slate_details, :coach_count, :string
    add_column :slate_details, :atheletes_count, :string
    add_column :slate_details, :manager_count, :string
  end
end
