class WorkoutsController < ApplicationController
  before_action :permit_coach, only: [:new, :create, :edit, :update, :destroy]
  before_action :valid_user_workout, only: [:show, :edit, :update, :destroy]

  def show
    # @workout provided by before_action valid_user_workout validating user permission
  end 

  def new 
    @team = current_user.team
    @metcons_list = current_user.team.metcons_list
    @workout = Workout.new
    @workout.metcons.build
  end

  def create
    @team = current_user.team
    #give workout team_id prior to saving since not included in params
    @workout = @team.workouts.build
    #see workout #metcons_attributes 
    if @workout.valid?
      @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      redirect_to new_workout_path
    end 
  end 

  def edit
    # @workout provided by before_action valid_user_workout validating user permission
    @team = current_user.team
    @metcons_list = current_user.team.metcons_list
    @new_metcon = @workout.metcons.build
    @metcons = @workout.metcons.select {|m| m.persisted? }
    #save workout_id in session for helpful redirect if nested metcon is changed
    session[:recently_edited_workout_id] = params[:id]
  end

  def update
    # @workout provided by before_action valid_user_workout validating user permission
  end

  def destroy
    # @workout provided by before_action valid_user_workout validating user permission
    @workout.destroy
    redirect_to team_path(current_user.team)
  end

  def workout_user_permitted?
    #requires workout instance variable to be set prior to calling
    @workout.team == current_user.team ? true : false
  end

  def valid_user_workout
    @workout = Workout.find_by(id: params[:id])
    if workout_user_permitted?
      @workout
    else
      redirect_to user_path(current_user)
    end
  end

  private

  def workout_params
    params.require(:workout).permit(
      "date(1i)", "date(2i)", "date(3i)",
      :metcons_attributes => [
        :title,
        :description,
        :score_by
      ]
    )
  end

end
