class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @users = @comments.map{|c| c.user}.uniq
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.categories.build
    @post.categories.build
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
