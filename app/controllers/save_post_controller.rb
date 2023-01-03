class SavePostController < ApplicationController
  before_action :authenticate_account!

  def create
  end

  def save
    @saved_post = SavePost.new(
      account_id: current_account.id,
      post_id: params[:id]
     )
    @saved_post.save!
  end
  
  def unsave
      @saved_post=SavePost.find_by(account_id: current_account.id,  post_id: params[:id])
       @saved_post.destroy
       
  end

  private

  def save_post_params
    params.require(:save).permit(:id)
  end
end
