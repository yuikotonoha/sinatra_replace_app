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
    # @follow_list = Follow.find_by_sql('select * from follows LEFT JOIN users ON follows.following_user_id = users.id where followed_user_id=($1) ORDER BY follow.id ASC;',params[:id])
    # @follower_list = db.exec('select * from follows LEFT JOIN users ON follows.follower_user_id = users.user_id where follow_user_id=($1) ORDER BY follow_user_id ASC;',params[:id])
    # @like_list = db.exec('select * from likes LEFT JOIN posts ON likes.post_id = posts.id where likes.user_id=($1) ORDER BY like_id ASC;',[params['user_id']])

  end

  def edit
  end

end
