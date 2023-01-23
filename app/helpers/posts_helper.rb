module PostsHelper
  def form_submit_tag(form, button_text)
    form.submit button_text, class: 'text-white'
  end

  def authorized_upvote(upvote)
    return upvote ? 'upvote' : 'downvote' if signed_in?

    'login'
  end

  def image_format_validation(img)
    img.to_s.include?('.png') or img.to_s.include?('.jpg')
  end

  def link_is_valid(link)
    link.to_s.match(URI.regexp)
  end

  def selected_community(community)
    return '' if params[:post] == 'new'

    community.id
  end

  def answered(post_id)
    answered = PollAnswer.find_by(account_id: current_account.id, post_id: post_id)
  end

  def get_poll_answer_values(post_id)
    poll_answer_total_count = PollAnswer.where(post_id: post_id).count
    return [poll_answer_total_count]
   end

   def poll_option_count(option)
     poll_option_count=PollAnswer.where(poll_answer: option).count
   end
   
   def poll_option_design(option)
    answer=PollAnswer.find_by(account_id: current_account.id,poll_answer: option)
    if answer
      return "card-text poll-css"
    else
      return "card-text"
    end
   end
 
end
