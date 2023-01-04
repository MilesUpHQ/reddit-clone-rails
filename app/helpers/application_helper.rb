module ApplicationHelper
    def error_msg(resource, field)
        if resource.errors.any?
          resource.errors.full_messages_for(field).each do |error_message|
            return error_message
          end
        end
        ""
      end
    
      def is_error(resource, field)
        if resource.errors.any?
          resource.errors.full_messages_for(field).each do |error_message|
            return " border-danger"
          end
        end
      end

    #   def error_msg_community field
    #     if @community.errors.any?
    #         @community.errors.full_messages_for(field).each do |error_message|
    #         return error_message
    #       end
    #     end
    #     ""
    #   end
    
    #   def is_error_community field
    #     if @community.errors.any?
    #         @community.errors.full_messages_for(field).each do |error_message|
    #         return " border-danger"
    #       end
    #     end
    #   end
end
