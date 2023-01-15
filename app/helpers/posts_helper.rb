module PostsHelper
  def form_submit_tag(form, button_text)
    form.submit button_text, class: 'text-white'
  end

  def authorized_upvote(upvote)
    return upvote ? 'upvote' : 'downvote' if signed_in?

    'login'
  end

  def active_nav(tab)
    return unless params[:tab].to_s == tab.to_s

    'active'
  end
end
