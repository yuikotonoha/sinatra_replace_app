class PostsController < ApplicationController

  # 投稿一覧を取得しインスタンス変数に代入
  def index
      @posts = Post.all
      # ヘッダー表示させるために、変数に代入
      # @nickname = User.find_by(id: current_user.id)

    # if user_signed_in?
    #   @posts = Post.all
    #   # ヘッダー表示させるために、変数に代入
    #   session[:nickname] = User.find_by(id: current_user.id)
    #   @nickname = session[:nickname]
    # else
    #   redirect_to controller: 'users', action: 'signin'
    # end
  end

  # オブジェクトを新規作成
  def new
    @post = Post.new
  end

  # postで投げられたデータを受け取る
  def create
    # binding.pry
    Post.create(title: post_params[:title], category: post_params[:category], user_id: current_user.id)
  end

  # ログインしていないユーザーをトップにリダイレクト
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

    private

    def post_params
      params.require(:post).permit(:title, :category)
    end

end
