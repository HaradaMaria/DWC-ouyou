class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    favorite = current_user.relationships.new(followed_id: user.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    user = User.find(params[:user_id])
    favorite = current_user.relationships.find_by(followed_id: user.id)
    favorite.destroy
    redirect_to request.referer
  end

  def followeds
    user = User.find(params[:user_id])
    @users = user.followeds
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
