class PostsController < ApplicationController

  # 投稿一覧を取得しインスタンス変数に代入
  def index
    @posts = Post.all
    # binding.pry
  end

  # 投稿の詳細画面を表示
  def show
    # binding.pry
    @post = Post.find_by(id: params[:id])
    @comments = Comment.where(post_id: params[:id])
    @comment = Comment.new

    #今見ている商品の口コミが投稿された場合、comment_controllerにpost_idを渡すための処理
    cookies[:post_id] = params[:id]
  end

  # オブジェクトを新規作成
  def new
    @post = Post.new
  end

  # postで投げられたデータを受け取る
  def create
    binding.pry
    Post.create(
        title: post_params[:title],
        category: post_params[:category],
        product_image: post_params[:product_image],
        user_id: current_user.id)
    redirect_to root_path
  end

  # ログインしていないユーザーをトップにリダイレクト
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  # 投稿を削除
  def destroy
    # binding.pry
    post = Post.find(params[:id])
    post.delete
    redirect_to root_path
  end

    private

    def post_params
      params.require(:post).permit(:title, :category, :product_image)
    end

end
