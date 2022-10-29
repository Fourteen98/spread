class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, posts: [:comments, {comments: [:author]}]).find(params[:user_id])
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
  end
  def show
    @post = Post.find(params[:id])
  end
end
