module Mailchimp
  module Models
    module Campaign   
      def self.included base
        base.send :include,  DataMapper::Resource
        base.send :property, :id,                 ::DataMapper::Property::String, :key    => true
        base.send :property, :web_id,             ::DataMapper::Property::Integer,:index  => true
        base.send :property, :list_id,            ::DataMapper::Property::String, :index  => true
        base.send :property, :title,              ::DataMapper::Property::String
        base.send :property, :type,               ::DataMapper::Property::String
        base.send :property, :create_time,        ::DataMapper::Property::DateTime
        base.send :property, :send_time,          ::DataMapper::Property::DateTime
        base.send :property, :status,             ::DataMapper::Property::String
        base.send :property, :from_name,          ::DataMapper::Property::String
        base.send :property, :from_email,         ::DataMapper::Property::String
        base.send :property, :subject,            ::DataMapper::Property::String
        base.send :property, :to_name,            ::DataMapper::Property::String
        base.send :property, :archive_url,        ::DataMapper::Property::URI
        base.send :property, :email_sent,         ::DataMapper::Property::Integer
        base.send :property, :inline_css,         ::DataMapper::Property::Boolean
        base.send :property, :analytics,          ::DataMapper::Property::String
        base.send :property, :analytics_tag,      ::DataMapper::Property::String
        base.send :property, :authenticate,       ::DataMapper::Property::Boolean
        base.send :property, :ecomm360,           ::DataMapper::Property::Boolean
        base.send :property, :auto_tweet,         ::DataMapper::Property::Boolean
        base.send :property, :auto_fb_post,       ::DataMapper::Property::Boolean
        base.send :property, :auto_footer,        ::DataMapper::Property::Boolean
        base.send :property, :timewarp,           ::DataMapper::Property::Boolean
        base.send :property, :timewarp_schedule,  ::DataMapper::Property::String
      end
    end
  end
end
