module AccountsHelper

  def error_message field
    if resource.errors.any?
      resource.errors.full_messages_for(field).each do |error_message|
        return error_message
      end
    end
    ""
  end 

  def is_errors field
    if resource.errors.any?
      resource.errors.full_messages_for(field).each do |error_message|
        return " border-danger"
      end 
    end
  end

end
