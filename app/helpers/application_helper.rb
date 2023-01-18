module ApplicationHelper
  def error_msg(resource, field)
    return resource.errors.full_messages_for(field).first if resource.errors.any?

    ''
  end

  def style_error_class(resource, field, css)
    return (css + ' border-danger').to_s if resource.errors[field].any?

    css.to_s
  end

  def display_profile_picture(resource, class_name, default_image)
    return image_tag(default_image, class: class_name) if resource.nil?

    image_path = resource.profile_image.attached? ? resource.profile_image : default_image
    image_tag(image_path, class: class_name)
  end
end
