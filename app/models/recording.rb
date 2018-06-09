class Recording < ApplicationRecord
  belongs_to :user
  belongs_to :show
  validates :name, presence: true, uniqueness: true
  # validates_associated :show, :user

  # NOTE : Use created_at for when it was created and updated_at for when it was updated (if it was)
  # NOTE : Added "active" flag for active vs deleted recordings + method for retrieving each type <<-- Added to User model
  # NOTE : Added name for user submittable attribute


  # Main method for allowing recording to be saved and making user updates
  def allow_recording
  end

  # Main method for checking
  def check_recording
  end

  ## Methods for allowing recording or not ##
  # private

  def set_variables
    @rec_show = self.show
    @recorder = self.user
    # puts "recorder = #{@recorder} || rec_show = #{@rec_show}"
  end

  # Check user has enough hours to record show
  def check_hours
    set_variables
    puts "recorder has : #{@recorder.current_recording_hours} || show cost : #{@rec_show.req_recording_hours}"
    if @recorder.current_recording_hours >= @rec_show.req_recording_hours
      puts "Recorder has enough hours to record show"
      return true
    end
    puts "Recorder needs more hours to record show"
    false
  end

  # Check user is old enough to record show
  def check_age
    set_variables
    puts "recorder is : #{@recorder.age} || min age : #{@rec_show.req_age}"
    if @recorder.age >= @rec_show.req_age
      puts "Recorder is old enough to record show"
      return true
    end
    puts "Recorder needs to be older to record show"
    false
  end

  # Method for updating user current hours
  def update_user_hours
    set_variables
  end

end
