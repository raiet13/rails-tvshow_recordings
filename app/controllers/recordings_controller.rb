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

  # Be able to create/set a recording
  def create
    puts "Recording Params = #{params}"
    recording = Recording.new(recordings_params(:name, :user_id, :show_id))
    if recording.save
      # Route to ???
    end

    # if ride.check_ride == ""
    #   ride.save
    #   ride.take_ride
    #   flash[:notice] = "Thanks for riding the #{ride.attraction.name}!"
    # else
    #   flash[:notice] = ride.check_ride
    # end
    # redirect_to user_path(current_user)
  end

  # Be able to update whether a recording is active or "deleted" (inactive)
  def update
    recording = Recording.find(params[:id])
    recording.update(recordings_params(:name, :active))
    redirect_to post_path(@post)
  end

  private

  def recordings_params(*args)
    params.permit(*args)
  end

end
