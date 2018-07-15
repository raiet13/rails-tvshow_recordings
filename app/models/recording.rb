class Recording < ApplicationRecord
  belongs_to :user
  belongs_to :show
  validates :name, presence: true, uniqueness: true
  # validates_associated :show, :user

  # NOTE : Use created_at for when it was created and updated_at for when it was updated (if it was)
  # NOTE : Added "active" flag for active vs deleted recordings + method for retrieving each type <<-- Added to User model
  # NOTE : Added name for user submittable attribute


  # rec = Recording.new(user: User.first, show: Show.first)

  # Main method for allowing recording to be saved and making user updates
  def allow_recording
    # Only update recorder if recording is allowed
    update_user_hours_active
    @recorder.save
    @notice
  end

  # Main method for checking
  def check_recording
    set_variables
    @notice = ""
    if !check_hours && !check_age
      @notice = "You are not old enough and do not have enough hours to record this show."
    elsif !check_hours
      @notice = "You do not have enough hours to record this show."
    elsif !check_age
      @notice = "You are not old enough to record this show."
    end
    @notice
  end

  # Toggle active -- https://stackoverflow.com/questions/40620649/how-to-toggle-a-boolean-attribute-in-a-controller-action
  def active_toggle!
    set_variables
    update active: !active
    if self.active
      puts "subtract user hours"
      update_user_hours_active
    else
      puts "return user hours"
      update_user_hours_inactive
    end
  end




  ## Methods for allowing recording or not ##
  private

  def set_variables
    @rec_show = self.show
    @recorder = self.user
    # puts "recorder = #{@recorder} || rec_show = #{@rec_show}"
  end

  # NOTE : Replaced by adding validation to these attributes
  # def check_user_variables
  #   set_variables
  #   puts "Recorder current hours = #{@recorder.current_recording_hours} || age = #{@recorder.age}"
  #   if @recorder.current_recording_hours && @recorder.age
  #     puts "Recorder has age and current_recording_hours"
  #     return true
  #   end
  #   puts "Recording missing age or current_recording_hours"
  #   false
  # end

  # Check user has enough hours to record show
  def check_hours
    # set_variables
    # puts "recorder has : #{@recorder.current_recording_hours} || show cost : #{@rec_show.req_recording_hours}"
    if @recorder.current_recording_hours >= @rec_show.req_recording_hours
      # puts "Recorder has enough hours to record show"
      return true
    end
    # puts "Recorder needs more hours to record show"
    false
  end

  # Check user is old enough to record show
  def check_age
    # set_variables
    # puts "recorder is : #{@recorder.age} || min age : #{@rec_show.req_age}"
    if @recorder.age >= @rec_show.req_age
      # puts "Recorder is old enough to record show"
      return true
    end
    # puts "Recorder needs to be older to record show"
    false
  end







  # Method for updating user current -- subtract current user hours
  def update_user_hours_active
    # set_variables
    # puts "UPDATE RECORDER HOURS => r hours = #{@recorder.current_recording_hours} || s hours = #{@rec_show.req_recording_hours}"
    @recorder.current_recording_hours -= @rec_show.req_recording_hours
    # puts "UPDATED RECORDER HOURS => r hours = #{@recorder.current_recording_hours}"
  end

  # Method for updating user current -- return current user hours
  def update_user_hours_inactive
    # set_variables
    # puts "UPDATE RECORDER HOURS => r hours = #{@recorder.current_recording_hours} || s hours = #{@rec_show.req_recording_hours}"
    @recorder.current_recording_hours += @rec_show.req_recording_hours
    # puts "UPDATED RECORDER HOURS => r hours = #{@recorder.current_recording_hours}"
  end

end
