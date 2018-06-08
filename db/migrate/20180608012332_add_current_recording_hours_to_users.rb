class AddCurrentRecordingHoursToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_recording_hours, :integer
  end
end
