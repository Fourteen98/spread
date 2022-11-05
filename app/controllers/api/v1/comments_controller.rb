class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: @post.id).includes(:author).order(created_at: :desc)
    render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save!
      render json: @comment, status: 201
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
