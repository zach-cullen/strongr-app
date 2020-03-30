class MetconsController < ApplicationController
  before_action :permit_coach

  def edit
    @metcon = Metcon.find_by(id: params[:id])
    valid_editor = current_user.team.metcons.include?(@metcon)
  end

  def update
    @metcon = Metcon.find_by(id: params[:id])
    valid_editor = current_user.team.metcons.include?(@metcon)
    if valid_editor
      @metcon.update(metcon_params)
    else
      redirect_to user_path(current_user)
    end
  end

  private

  def metcon_params
    params.require(:metcon).permit(:description, :score_by)
  end
end
