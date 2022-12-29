module SavePostHelper

  def is_saved post
    account_signed_in? && post.saved ? " active" : ""
  end

end
