class RecordingsController < ApplicationController
  before_action :redirect_if_not_logged_in

  # Show all existing recordings belonging to user or all period
  def index
    puts "index params = #{params}"
    if params[:format]
      @recordings_user = User.find(params[:format])
      @recordings = @recordings_user.all_recordings
    else
      @recordings = Recording.all
    end
  end

  # Create new recording
  def new
    # puts "New Params = #{params}"
    @show = Show.find(params[:format])
    @recording = Recording.new
    @recording.name = current_user.name + "_" + @show.recording_name
  end

  # Be able to create/set a recording
  def create
    puts "Recording Params = #{params}"
    recording = Recording.new(recordings_params(:name, :user_id, :show_id))

    if recording.check_recording == ""
      flash[:notice] = ""
      recording.save
      recording.allow_recording
      redirect_to recordings_path(current_user)
    else
      flash[:notice] = recording.check_recording
      show = Show.find(params[:show_id])
      redirect_to show_path(show)
    end
  end
  
  def edit
    @recording = Recording.find(params[:id])
  end

  # Be able to update whether a recording is active or "deleted" (inactive)
  def update
    recording = Recording.find(params[:id])
    recording.active_toggle!
    redirect_to recordings_path(current_user)
  end

  private

  def recordings_params(*args)
    params.require(:recording).permit(*args)
  end

end
