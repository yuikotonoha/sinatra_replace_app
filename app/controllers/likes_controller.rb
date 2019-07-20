class LikesController < ApplicationController

  def touch
    already_good = Like.find_by(post_id: cookies[:post_id], user_id: current_user.id)
    binding.pry
  end

end
