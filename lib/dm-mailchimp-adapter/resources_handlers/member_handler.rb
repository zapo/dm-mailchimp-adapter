module Mailchimp
  module ResourceHandlers
    class MemberHandler < AbstractResourceHandler

      def create collection
        result = []
        collection.group_by { |m| m.list_id }.each do |list_id, members|
          result << @connection.list_batch_subscribe(
            list_id, 
            members.map {|m| {'EMAIL' => m.email}},
            @options[:list_on_subscribe_double_optin], 
            @options[:list_on_subscribe_update_exiting],
            @options[:list_on_subscribe_replace_interests]
          )
        end
        result.flatten.map {|r| r['add_count']}.reduce(:+)
      end
    
      def read query
        members = lists.inject([]) { |res, l| 
          
          list_members = @connection.list_members(l['id'], 'subscribed', 0, 0, 5000)['data'] rescue []
          list_members.each {|m| m['list_id'] = l['id']}
          res << list_members
        }.flatten

        query.filter_records members
      end
      
      def delete collection
        result = []
        collection.group_by { |m| m.list_id }.each do |list_id, members|
          result << @connection.list_batch_unsubscribe(
            list_id, 
            members.map(&:email), 
            @options[:list_on_unsubscribe_delete_member],
            @options[:list_on_unsubscribe_send_goodbye] ,
            @options[:list_on_unsubscribe_send_notify]
          )
        end
        
        result.flatten.map {|r| r['delete_count']}.reduce(:+)
      end
      
      private
      
      def lists
        @lists ||= @connection.lists['data'] rescue []
      end
    end
  end
end