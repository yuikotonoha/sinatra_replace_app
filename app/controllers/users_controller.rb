class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    # 今見ているユーザーの投稿一覧を取得
    @posts = Post.where(user_id: params[:id])
    # 今見るユーザーの情報を取得
    @user = User.find_by(id: params[:id])
    # フォローしているかの判定
    @follow_check = Follow.find_by(followed_user_id: params[:id], following_user_id: current_user.id)

    #今見ているユーザーがフォローされた場合、comment_controllerにpost_idを渡すための処理
    cookies[:followed_user_id] = params[:id]

    # フォローしてる人、フォロワー情報、お気に入りしている投稿情報を取得
    followed_user_ids = Follow.where(following_user_id: params[:id]).pluck(:followed_user_id)
    @follow_list = User.find(followed_user_ids)

    following_user_ids = Follow.where(followed_user_id: params[:id]).pluck(:following_user_id)
    @follower_list = User.find(following_user_ids)

    like_post_ids = Like.where(user_id: params[:id]).pluck(:post_id)
    @like_list = Post.find(like_post_ids)

    # タイムライン（フォローしている人の投稿一覧）を取得
    timeline_post_ids = Follow.where(following_user_id: params[:id]).pluck(:followed_user_id)
    @post_list = Post.where(user_id: timeline_post_ids )

    # フォロー数と、フォロワー数、お気に入り投稿数をカウント
    @follow_count = Follow.where(following_user_id: params[:id]).count
    @follower_count = Follow.where(followed_user_id: params[:id]).count
    @like_count = Like.where(user_id: params[:id]).count

  end

  def edit
  end

end
