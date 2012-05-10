module Mailchimp
  module ResourceHandlers
    class AbstractResourceHandler
      def initialize model, connection, options
        
        @model      = model
        @connection = connection
        @options    = options
        
        default = {
          :list_on_subscribe_double_optin       => false, 
          :list_on_subscribe_update_exiting     => false,
          :list_on_subscribe_replace_interests  => false,
          :list_on_unsubscribe_delete_member    => true,
          :list_on_unsubscribe_send_goodbye     => false,
          :list_on_unsubscribe_send_notify      => false
        }
        
        @options = default.merge(@options)
      end

      def create collection
        raise NotImplementedError, "#{self.class}#create not implemented"
      end

      def update attributes, collection
        raise NotImplementedError, "#{self.class}#update not implemented"
      end

      def read query
        raise NotImplementedError, "#{self.class}#read not implemented"
      end

      def delete collection
        raise NotImplementedError, "#{self.class}#delete not implemented"
      end
    end
  end
end

require 'dm-mailchimp-adapter/resources_handlers/campaign_handler'
require 'dm-mailchimp-adapter/resources_handlers/list_handler'
require 'dm-mailchimp-adapter/resources_handlers/member_handler'