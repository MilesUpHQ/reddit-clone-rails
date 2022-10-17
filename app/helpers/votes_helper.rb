module VotesHelper
  def is_upvoted discussion
    user_signed_in? && current_user.upvoted_discussion_ids.include?(discussion.id)? " active" : ""
  end

  def is_downvoted discussion
    user_signed_in? && current_user.downvoted_discussion_ids.include?(discussion.id)? " active" : ""
  end

end   
