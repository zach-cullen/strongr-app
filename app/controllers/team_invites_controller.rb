class TeamInvitesController < ApplicationController
  before_action :verify_user_access, only: [:show]

  def new
    #builds invite automatically associated with team
    @team = current_user.team 
    @invite = TeamInvite.new
  end

  def create
    #post action only for coaches
    @team = current_user.team
    if valid_user
      if !valid_user.has_team?
        @invite = valid_user.team_invites.build
        @team.team_invites << @invite
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
    #athlete and coach can both destroy
    #athlete accepts they mutate self then destroy
    #athlete declines they destroy without mutating self
    #coach can expire invitation to destroy
  end

  def valid_user
    @user = User.find_by(email: team_invite_params[:user_attributes][:email])
    if !!@user
      @user
    else
      false
    end
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
