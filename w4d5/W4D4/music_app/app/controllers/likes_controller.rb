class LikesController < ApplicationController

  def create
    album_id = params[:album_id] * 1
    user_id = current_user.id

    like = Like.new(user_id: user_id, album_id: album_id)

    if like.save
      redirect_to user_url(current_user)
    else
      flash[:errors] = like.errors.full_messages
      redirect_to album_url(album_id)
    end
  end

  def destroy

  end
end
