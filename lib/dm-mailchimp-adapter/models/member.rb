module Mailchimp
  module Models
    module Member      
      def self.included base
        base.send :include,  DataMapper::Resource
        base.send :property, :email,     ::DataMapper::Property::String, :key => true
        base.send :property, :list_id,   ::DataMapper::Property::String, :key => true
        base.send :property, :timestamp, ::DataMapper::Property::DateTime
      end
    end
  end
end
