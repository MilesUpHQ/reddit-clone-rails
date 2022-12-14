class SavePostController < ApplicationController
  before_action :authenticate_account!

  def create
    set_saved_post
    if @saved_post.nil?
      @saved_post = SavePost.new(
        account_id: current_account.id,
        post_id: params[:id]
      )
      @saved_post.save
      flash[:notice] = t("post.save")
      @is_saved = true
    else
      @saved_post.destroy
      flash[:notice] = t("post.unsave")
      @is_saved = false
    end

    respond_to do |format|
      format.js {
        @post_id = params[:id]
        render "save_post/create"
      }
    end
  end

  private

  def set_saved_post
    @saved_post = SavePost.find_by(account_id: current_account.id,  post_id: params[:id])
  end

  def save_post_params
    params.require(:save).permit(:id)
  end
end
