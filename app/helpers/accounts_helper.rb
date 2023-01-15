module AccountsHelper
  def error_message(field)
    return resource.errors.full_messages_for(field).first if resource.errors.any?

    ''
  end

  def is_errors(field)
    return unless resource.errors[field].any?

    ' border-danger'
  end
end
