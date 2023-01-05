module Image
  extend ActiveSupport::Concern

  def validate_image(image, field)
    return unless image.attached?
    acceptable_types = ["image/jpeg", "image/png", "image/gif"]
    unless acceptable_types.include?(image.content_type)
      return errors.add(field, "must be a JPEG or PNG")
    end
  end

  def validate_multiple_images(images, field)
    return unless images.attached?
    acceptable_types = ["image/jpeg", "image/png", "image/gif"]
    images.each do |image|
      unless acceptable_types.include?(image.content_type)
        return errors.add(field, "must be a JPEG or PNG")
      end
    end
  end

end
