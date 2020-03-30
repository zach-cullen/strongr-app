class MetconsController < ApplicationController
  before_action :permit_coach

  def create
    
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

  private

  def valid_editor
    current_user.team.metcons.include?(@metcon)
  end

  def metcon_params
    params.require(:metcon).permit(:description, :score_by)
  end
end
