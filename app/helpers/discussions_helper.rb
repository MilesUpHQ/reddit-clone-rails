module DiscussionsHelper

  def discussion_author(discussion)
    user_signed_in? && current_user.id == discussion.user_id
  end

  def reply_author(reply)
    user_signed_in? && current_user.id == reply.user_id
  end

  def discussion_liked_by_user?discussion_id
    Like.where(discussion_id: discussion_id).any?
  end
end
 