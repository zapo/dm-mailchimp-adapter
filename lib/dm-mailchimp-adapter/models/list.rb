module Mailchimp
  module Models
    module List   
      def self.included base
        base.send :include,  DataMapper::Resource
        base.send :property, :id,                   ::DataMapper::Property::String,   :key => true
        base.send :property, :web_id,               ::DataMapper::Property::Integer,  :index => true
        base.send :property, :name,                 ::DataMapper::Property::String
        base.send :property, :date_created,         ::DataMapper::Property::DateTime
        base.send :property, :email_type_option,    ::DataMapper::Property::Boolean
        base.send :property, :use_awesomebar,       ::DataMapper::Property::Boolean
        base.send :property, :default_from_name,    ::DataMapper::Property::String
        base.send :property, :default_from_email,   ::DataMapper::Property::String
        base.send :property, :default_subject,      ::DataMapper::Property::String
        base.send :property, :default_language,     ::DataMapper::Property::String
        base.send :property, :list_rating,          ::DataMapper::Property::Float
        base.send :property, :subscribe_url_short,  ::DataMapper::Property::URI
        base.send :property, :subscribe_url_long,   ::DataMapper::Property::URI
        base.send :property, :beamer_address,       ::DataMapper::Property::String
        base.send :property, :stats,                ::DataMapper::Property::Json
        base.send :property, :modules,              ::DataMapper::Property::Json
      end
    end
  end
end
