module Mailchimp
  module ResourceHandlers
    class AbstractResourceHandler
      def initialize model, connection
        @model      = model
        @connection = connection
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