class MetconsController < ApplicationController
  before_action :permit_coach

  def create
    #if metcon created from edit workout page, passes workout_id to build association
    if metcon_params[:workout_id]
      @workout = Workout.find_by(id: metcon_params[:workout_id])
      if valid_workout_user
        @metcon = Metcon.new(metcon_params)
        #validate then add to workout to save
        @workout.metcons << @metcon
        redirect_to workout_path(@workout)
      else
        redirect_to user_path(current_user)
      end
    end 
  end


  def edit
    @metcon = Metcon.find_by(id: params[:id])
    if !valid_editor
      redirect_to user_path(current_user)
    end
  end

  def update
    @metcon = Metcon.find_by(id: params[:id])

    if !!session[:recently_edited_workout_id]
      @workout_for_redirect = Workout.find_by(id: session[:recently_edited_workout_id])
    end 

    if valid_editor
      @metcon.update(metcon_params)
      if @workout_for_redirect
        #expire the session info since the workout is cached for this action
        session[:recently_edited_workout_id] = nil
        redirect_to workout_path(@workout_for_redirect)
      else 
        redirect_to team_path(current_user.team)
      end
    else
      redirect_to user_path(current_user)
    end
  end

  def valid_workout_user
    @workout.team == current_user.team ? true : false
  end

  private

  def valid_editor
    current_user.team.metcons.include?(@metcon)
  end

  def metcon_params
    params.require(:metcon).permit(:title, :description, :score_by, :workout_id)
  end
end
