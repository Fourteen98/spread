class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, posts: [:comments, { comments: [:author] }]).find(params[:user_id])
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    pp params.inspect

    if @post.save!
      puts " i got here !!"
      redirect_to user_posts_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end
