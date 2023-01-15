module ApplicationHelper
  def error_msg(resource, field)
    return resource.errors.full_messages_for(field).first if resource.errors.any?

    ''
  end

  def style_error_class(resource, field, css)
    return (css + ' border-danger').to_s if resource.errors[field].any?

    css.to_s
  end
end
