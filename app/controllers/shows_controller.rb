class ShowsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :check_user_recorded_show
  skip_before_action :check_user_recorded_show, only: [:index, :new, :create, :show]

  # Show all shows <<-- all shows recorded by user are checked (via view)
  def index
    @shows = Show.all
  end

  # New Show
  def new
    @show = Show.new
  end

  # Create only if show doesn't exist
  def create
    show = Show.find_by(name: params[:name])
    if show
      flash[:notice] = "The show you attempted to create already exists."
      redirect_to show_path(show)
    else
      new_show = Show.create(show_params)
      if new_show.save
        flash[:notice] = ""
        redirect_to show_path(new_show)
      else
        flash[:notice] = "Something went wrong during show creation, please try again."
  			render :new
      end
    end
  end

  # Show Profile
  def show
    @show = Show.find(params[:id])
  end

  # Edit Show if User has recorded it
  def edit
    @show = Show.find(params[:id])
  end

  def update
    show = Show.find(params[:id])
    if show.update(show_params)
      flash[:notice] = ""
      redirect_to show_path(show)
    else
      flash[:notice] = "Something went wrong when you edited the show, please try again."
      @show = show
      render :edit
    end
  end

  # Delete Show if User has recorded it
  def destroy
    show = Show.find(params[:id])
    show.destroy
    redirect_to shows_path
  end

  private

  def show_params
    params.require(:show).permit(:name, :description, :req_recording_hours, :req_age)
  end

  # NOTE : Adding check that user "is allowed" to modify the show <<-- current implementation allows for inclusion of past recordings
  def check_user_recorded_show
    show = Show.find(params[:id])
    if !current_user.user_has_show(show)
      flash[:notice] = "You can only modify information for shows that you have recorded."
      redirect_to show_path(show)
    end
  end

end
