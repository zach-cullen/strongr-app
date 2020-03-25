class TeamsController < ApplicationController
  before_action :block_user_if_has_team, only: [:new, :create]

  #remove index after development phase
  def index
    @teams = Team.all
  end

  def show
    @team = valid_team_membership
    #abstract to scope method
    if @team
      @coach = @team.users.where(is_coach: true).first
      @athletes = @team.users.where(is_coach: false)
      @workouts = @team.workouts
    else
      redirect_to user_path(current_user)
    end
  end

  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(team_params)
    @team.users << current_user
    if @team.save
      current_user.make_coach
      redirect_to user_path(current_user)
    else
      render :new
    end 
  end 

  def block_user_if_has_team
    if current_user.has_team?
      redirect_to user_path(current_user)
    end 
  end

  def valid_team_membership
    @team = current_user.team
    if @team.id == params[:id].to_i
      @team
    else 
      false
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
