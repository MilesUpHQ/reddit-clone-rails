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

  def selected_community communities
    communities.include?(params[:community].to_i) ? params[:community] : ""
  end

  def pass_community_params community
    community.nil? ? new_community_post_path : new_community_post_path(community: community.id)
  end

end
