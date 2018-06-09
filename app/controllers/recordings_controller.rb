class RecordingsController < ApplicationController
  before_action :redirect_if_not_logged_in

  # Show all recordings belonging to user (not show)
  def index
    puts "index params = #{params}"
    if params[:user_id]
      @recordings = current_user.recordings
    else
      flash[:notice] = "You can only view recordings from your account."
      redirect_to user_path(current_user)
    end
  end

  # Create new recording
  def new
  end

  # Be able to create/set a recording
  def create
    puts "Recording Params = #{params}"
    recording = Recording.new(recordings_params(:name, :user_id, :show_id))

    if recording.check_recording == ""
      recording.save
      recording.allow_recording
      redirect_to users_active_recordings(current_user)
    else
      flash[:notice] = recording.check_recording
      show = Show.find(params[:show_id])
      redirect_to show_path(show)
    end
  end

  # Be able to update whether a recording is active or "deleted" (inactive)
  def update
    recording = Recording.find(params[:id])
    recording.update(recordings_params(:name, :active))
    redirect_to users_active_recordings(current_user)
  end

  private

  def recordings_params(*args)
    params.permit(*args)
  end

end
