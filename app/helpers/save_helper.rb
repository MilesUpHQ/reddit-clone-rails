module SaveHelper

  def is_saved post
    account_signed_in? && post.saved === "true" ? " active" : ""
  end

end
