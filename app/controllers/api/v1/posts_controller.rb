class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)

    render json: @posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:comments).find(params[:id])
    @comments = Comment.where(post_id: @post.id).includes(:author).order(created_at: :desc)
    render json: { post: @post, comments: @comments }
  end
end
