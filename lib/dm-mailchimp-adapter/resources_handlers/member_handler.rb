module Mailchimp
  module ResourceHandlers
    class MemberHandler < AbstractResourceHandler
      
      def lists
        @lists ||= @connection.lists['data'] rescue []
      end
      
      def create collection
        raise NotImplementedError.new
      end
    
      def update attributes, collection
        raise NotImplementedError.new
      end
    
      def read query
        members = lists.inject([]) { |res, l| 
          
          list_members = @connection.list_members(l['id'], 'subscribed', 0, 0, 5000)['data'] rescue []
          list_members.each {|m| m['list_id'] = l['id']}
          res << list_members
        }.flatten

        query.filter_records members
      end
    end
  end
end