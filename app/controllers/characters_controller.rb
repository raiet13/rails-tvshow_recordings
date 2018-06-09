class CharactersController < ApplicationController
  before_action :redirect_if_not_logged_in

  # New Character <<-- needs to inherit from show (should be show_id)
  def new
    puts "new params = #{params}"
    if params[:show_id] && !Show.exists?(params[:show_id])
      flash[:notice] = "You can only create characters for shows that exist."
      redirect_to shows_path
    else
      @character = Character.new(show_id: params[:show_id])
    end
  end

  # Create new character
  def create
    puts "Create params = #{params}"
    character = Character.new(char_params)
    if character.save
      show = Show.find(params[:character][:show_id])
      redirect_to show_path(show)
    else
      flash[:notice] = "Something went wrong during character creation, please try again."
      render :new
    end
  end

  # Edit character
  def edit
    if params[:show_id]
      show = Show.find_by(id: params[:show_id])
      if show.nil?
        flash[:notice] = "You can only create characters for shows that exist."
        redirect_to shows_path
      else
        @character = show.characters.find_by(id: params[:id])
        if @character.nil?
          flash[:notice] = "You can only edit characters that exist for this show."
          redirect_to show_path(show)
        end
      end
    else
      @character = Character.find(params[:id])
    end
  end

  # Update character name
  def update
    character = Character.find(params[:id])
    character.update(char_params)
    if character.save
      show = Show.find(params[:character][:show_id])
      redirect_to show_path(show)
    else
      flash[:notice] = "Something went wrong during character update, please try again."
      render :edit
    end
  end

  # Delete character (if say it was created for the wrong show)
  def destroy
    character = Character.find(params[:id])
  end

  private

  def char_params
    params.require(:character).permit(:name, :role, :description, :show_id])
  end


end
