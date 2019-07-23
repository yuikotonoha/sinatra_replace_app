class PostSearch
  include ActiveModel::Model

  attr_accessor :search_title

  def execute
    Post.ransack(title_cont: @search_title).result
  end
end