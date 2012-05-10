module Mailchimp
  module ResourceHandlers
    class CampaignHandler < AbstractResourceHandler

      def read query
        campaigns = @connection.campaigns['data'] rescue []
        query.filter_records(campaigns)
      end
    end
  end
end