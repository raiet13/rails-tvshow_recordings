class CharactersController < ApplicationController
  before_action :redirect_if_not_logged_in

  # New Character <<-- needs to inherit from show (should be show_id)
  def new
    puts "params = #{params}"
    @character = Character.new
  end

  # Create new character
  def create
    character = Character.new(char_params)

  end

  # Edit character (name only)
  def edit
    @character = Character.find(params[:id])
  end

  # Update character name
  def update
    character = Character.find(params[:id])
  end

  # Delete character (if say it was created for the wrong show)
  def destroy
    character = Character.find(params[:id])
  end

  private

  def char_params
    params.require(:character).permit(:name, :role, :description, show: [:id]) # OR :show_id
  end


end
