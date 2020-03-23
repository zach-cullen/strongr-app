class TeamInvitesController < ApplicationController
  before_action :verify_user_access, only: [:show, :destroy]

  def new
    #builds invite automatically associated with team
    @team = current_user.team 
    @invite = TeamInvite.new
  end

  def create
    #post action only for coaches
    @team = current_user.team
    if valid_creator
      if !valid_creator.has_team?
        @invite = valid_creator.team_invites.build
        @team.team_invites << @invite
        redirect_to team_path(@team)
      else
        redirect_to new_team_invite_path
        flash[:alert] = "The user at this address already has a team."
      end
    else
      redirect_to new_team_invite_path
      flash[:alert] = "No user found with this email."
    end
  end

  def show
    @invite = TeamInvite.find_by(id: params[:id])
    #view for coaches and athletes
    #athlete accept and decline both destroy invite
    
  end

  def destroy
    @invite = TeamInvite.find_by(id: params[:id])
    if params[:accepted] == "true"
      @invite.team.users << current_user
      @invite.destroy
      redirect_to user_path(current_user)
    elsif params[:accepted] == "false"
      @invite.destroy
      redirect_to user_path(current_user)
    else
      redirect_to :root
    end 

    # if current_user == @invite.user
    # else

    #athlete and coach can both destroy
    #athlete accepts they mutate self then destroy
    #athlete declines they destroy without mutating self
    #coach can expire invitation to destroy
  end

  def valid_creator
    @user = User.find_by(email: team_invite_params[:user_attributes][:email])
    !!@user ? @user : false
  end

  def verify_user_access
    redirect_to user_path(current_user) unless permitted
  end

  def permitted
    @invite = TeamInvite.find_by(id: params[:id])
    if @invite.user == current_user 
      true
    elsif @invite.team == current_user.team
      current_user.is_coach?
    else
      false
    end
  end

  private

  def team_invite_params
    params.require(:team_invite).permit(user_attributes: [:email])
  end

end
