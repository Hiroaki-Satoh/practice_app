class RelationshipsController < ApplicationController
  # フォローする
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  # フォローを外す
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー(自分がフォローしている人)の表示
  def followed
    user = User.find(params[:user_id])
    @users = user.follower_user
  end

  # フォロワー(自分をフォローしている人)の表示
  def follower
    user = User.find(params[:user_id])
    @users = user.following_user
  end
end
