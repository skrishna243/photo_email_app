class AddColumnToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :data_archival, :string
  end
end
