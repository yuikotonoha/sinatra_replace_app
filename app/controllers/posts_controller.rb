class PostsController < ApplicationController

  # 投稿一覧を取得しインスタンス変数に代入
  def index
    @posts = Post.all
  end

  # オブジェクトを新規作成
  def new
    @post = Post.new
  end

  # postで投げられたデータを受け取る
  def create
    Post.create(name: post_params[:title], price: post_params[:category], user_id: current_user.id)
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
