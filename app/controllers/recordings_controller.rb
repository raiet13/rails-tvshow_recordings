class RecordingsController < ApplicationController
  before_action :redirect_if_not_logged_in

  # Be able to create/set a recording
  def create
    puts "Recording Params = #{params}"
    recording = Recording.new(:user_id, :attraction_id, :active)
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
    @recording = Recording.find(params[:id])
    @recording.update(recordings_params(:active))
    redirect_to post_path(@post)
  end

  private

  def recordings_params(*args)
    params.permit(*args)
  end

end
