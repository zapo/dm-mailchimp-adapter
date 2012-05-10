module Mailchimp
  module ResourceHandlers
    class ListHandler < AbstractResourceHandler
      
      def read query
        lists = @connection.lists['data'] rescue []
        query.filter_records(lists)
      end
      
    end
  end
end