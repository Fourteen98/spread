class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    redirect_to user_post_path(params[:user_id], params[:post_id]) if @comment.save!
  end

  def destroy
    @user = User.find(params[:user_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_posts_path(@user), notice: 'Comment Deleted!'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
