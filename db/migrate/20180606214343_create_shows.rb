class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :name
      t.integer :req_recording_hours
      t.integer :req_age

      t.timestamps null: false
    end
  end
end
