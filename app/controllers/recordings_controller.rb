class RecordingsController < ApplicationController

  # Be able to create/set a recording
  def create
  end

  # Be able to update whether a recording is active or "deleted" (inactive)
  def update
  end

  private

  def recordings_params
    params.permit(:user_id, :attraction_id, :active)
  end

end
