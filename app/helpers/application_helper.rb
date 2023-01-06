module ApplicationHelper
    def error_msg(resource, field)
        if resource.errors.any?
          resource.errors.full_messages_for(field).each do |error_message|
            return error_message
          end
        end
        ""
      end

      def style_error_class(resource, field, css)
        if resource.errors.any?
          resource.errors.full_messages_for(field).each do |error_message|
            return (css+" border-danger").to_s
          end
        end
        return css.to_s
      end

  end
