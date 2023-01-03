module AccountsHelper

  def error_msg field
    if resource.errors.any?
      resource.errors.full_messages_for(field).each do |error_message|
        return error_message
      end
    end
    ""
  end

  def is_error field
    if resource.errors.any?
      resource.errors.full_messages_for(field).each do |error_message|
        return " border-danger"
      end
    end
  end

end
