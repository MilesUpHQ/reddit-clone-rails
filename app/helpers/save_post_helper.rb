module SavePostHelper

  def is_saved post
    account_signed_in? && post.saved ? true : false
  end

  def save_or_unsave post
    post.saved? ? " Unsave" : " Save"
  end

  def joined post
    Subscription.where(community_id: post.community_id, account_id: post.account_id).exists?
  end

end
