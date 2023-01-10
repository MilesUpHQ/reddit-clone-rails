module ApplicationHelper
    def error_msg(resource, field)
        if resource.errors.any?
          return resource.errors.full_messages_for(field).first
        end
        ""
      end

      def style_error_class(resource, field, css)
        if resource.errors.any?
          if resource.errors.full_messages_for(field).first
            return (css+" border-danger").to_s
          end
        end
        return css.to_s
      end
  end
