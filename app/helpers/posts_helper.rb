module PostsHelper
    def form_submit_tag(form, button_text)
        form.submit button_text, class: "text-white"
     end
end
  