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
          :list_on_subscribe_replace_interests  => false
        }
        
        @options = default.merge(@options)
      end

      def create collection
        raise NotImplementedError.new
      end

      def update attributes, collection
        raise NotImplementedError.new
      end

      def read query
        raise NotImplementedError.new
      end

      def delete collection
        raise NotImplementedError.new
      end
    end
  end
end

require 'dm-mailchimp-adapter/resources_handlers/campaign_handler'
require 'dm-mailchimp-adapter/resources_handlers/list_handler'
require 'dm-mailchimp-adapter/resources_handlers/member_handler'