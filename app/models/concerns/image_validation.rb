module ImageValidation
  extend ActiveSupport::Concern
  ACCEPTABLE_IMAGES = ['image/jpeg', 'image/png', 'image/gif']

  def validate_image(image, field)
    return unless image.attached?

    check_for_error(image, field)
  end

  def validate_multiple_images(images, field)
    return unless images.attached?

    images.each do |image|
      check_for_error(image, field)
    end
  end

  def check_for_error(image, field)
    return if ACCEPTABLE_IMAGES.include?(image.content_type)

    errors.add(field, 'must be a JPEG or PNG')
  end
end
