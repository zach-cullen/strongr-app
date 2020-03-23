class TeamInvitesController < ApplicationController

  def new
    #form only for coaches
  end

  def create
    #post action only for coaches
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

end
