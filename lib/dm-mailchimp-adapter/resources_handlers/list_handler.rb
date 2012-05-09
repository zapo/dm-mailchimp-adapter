module Mailchimp
  module ResourceHandlers
    class ListHandler < AbstractResourceHandler
      
      def create collection
        raise NotImplementedError.new
      end
    
      def update attributes, collection
        raise NotImplementedError.new
      end
    
      def read query
        lists = @connection.lists['data'] rescue []
        query.filter_records(lists)
      end
    
      def delete collection
        raise NotImplementedError.new
      end
      
    end
  end
end