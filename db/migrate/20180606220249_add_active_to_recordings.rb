class AddActiveToRecordings < ActiveRecord::Migration[5.2]
  def change
    add_column :recordings, :active, :boolean, default: true
  end
end
