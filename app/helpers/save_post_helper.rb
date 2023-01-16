module SavePostHelper
  def set_saved_post(post)
    @saved_post = SavePost.find_by(account_id: current_account.id, post_id: post.id) if account_signed_in?
  end

  def is_saved(post)
    set_saved_post post
    account_signed_in? && @saved_post ? 'fa-bookmark' : 'fa-bookmark-o'
  end

  def save_or_unsave(post)
    set_saved_post post
    @saved_post ? ' Unsave' : ' Save'
  end

  def joined(post)
    Subscription.where(community_id: post.community_id, account_id: post.account_id).exists?
  end

  def pass_community_params(community)
    community.nil? ? submit_new_community_post_path(post: :new) : new_community_post_path(@community)
  end

  def authorized_save_post
    account_signed_in? ? 'save' : 'login'
  end
end
