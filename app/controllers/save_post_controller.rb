class SavePostController < ApplicationController
  def create
    @post = Post.find(params[:id])

    @post.update(saved: @post.saved ? false : true)

    respond_to do |format|
      format.js {
        @post = Post.find(params[:id])
        @is_saved = @post.saved
        render "save_post/create"
      }
    end

  end

  private

  def save_post_params
    params.require(:save).permit(:id)
  end
end
