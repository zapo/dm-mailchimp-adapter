module Mailchimp
  module Models
    module Member      
      def self.included base
        base.send :include,  DataMapper::Resource
        base.send :property, :email,     ::DataMapper::Property::String, :key => true
        base.send :property, :list_id,   ::DataMapper::Property::String, :key => true
        base.send :property, :timestamp, ::DataMapper::Property::DateTime, :writer => :private
        
        base.send :validates_uniqueness_of, :email, :scope => :list_id, :message => 'A member with this email already exists in this list'
      end
    end
  end
end
