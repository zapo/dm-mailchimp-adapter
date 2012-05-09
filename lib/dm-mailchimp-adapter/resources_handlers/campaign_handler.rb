module Mailchimp
  module ResourceHandlers
    class CampaignHandler < AbstractResourceHandler
      
      def create collection
        raise NotImplementedError.new
      end
    
      def update attributes, collection
        raise NotImplementedError.new
      end
    
      def read query
        campaigns = @connection.campaigns['data'] rescue []
        query.filter_records(campaigns)
      end
    
      def delete collection
        raise NotImplementedError.new
      end
      
    end
  end
end