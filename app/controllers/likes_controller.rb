class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = Post.find(params[:user_id])
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]

    if @like.save!
      flash[:success] = 'Liked'
      redirect_to user_post_path(@user, @post)
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  # def likes_params
  #   params.require(:like).permit(:user_id, :id)
  # end
end
