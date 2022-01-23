class FavoritesController < ApplicationController
  def create
    alchool = Alchool.find(params[:alchool_id])
    favorite = current_user.favorites.new(alchool_id: alchool.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    alchool = Alchool.find(params[:alchool_id])
    favorite = current_user.favorites.find_by(alchool_id: alchool.id)
    favorite.destroy
    redirect_to request.referer
  end
end
