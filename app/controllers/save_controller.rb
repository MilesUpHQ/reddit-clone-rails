class SaveController < ApplicationController
  def create
    @post = Post.find(params[:id])

    if @post.saved == true
      @post.update(saved: false)
    else
      @post.update(saved: true)
    end

    respond_to do |format|
      format.js {
        @post = Post.find(params[:id])
        @is_saved = @post.saved
        render "save/create"
      }
    end

  end

  private

  def save_post_params
    params.require(:save).permit(:id)
  end
end
