class LikesController < ApplicationController

  def touch
    already_good = Like.find_by(post_id: cookies[:post_id], user_id: current_user.id)
    # binding.pry

    if already_good.nil?
      Like.create(post_id: cookies[:post_id], user_id: current_user.id)
      redirect_to post_path(cookies[:post_id])
    else
      already_good.delete
      redirect_to post_path(cookies[:post_id])
    end

  end

  private

    # def like_params
    #   params.require.permit(:post_id, :user_id)
    # end

end
