module Mailchimp
  class Adapter < DataMapper::Adapters::AbstractAdapter
    
    include ResourceHandlers
    
    def connection
      @connection ||= open_connection
    end
    
    def field_naming_convention
       proc {|property| property.name.to_s }
    end

    def resource_naming_convention
      proc {|resource| resource.to_s }
    end
    
    def open_connection
      conn = Hominid::API.new(options[:api_key], options.reject {|k,| k == :api_key})
      LOGGER.debug 'Connection established ...' if conn
      conn
    end
    
    def with_connection &block
      block.call connection
    end
    
    def create(collection)
      return true if collection.empty?
      
      with_connection do |connection|
        handler_for(collection.first.model, connection).create(collection)
      end
    end

    def update(attributes, collection)
      return true if collection.empty?
      
      with_connection do |connection|
        handler_for(collection.first.model, connection).update(attributes, collection)
      end
    end

    def delete(collection)
      return true if collection.empty?
      
      with_connection do |connection|
        handler_for(collection.first.model, connection).delete(collection)
      end
    end

    def read(query)
      with_connection do |connection|
        handler_for(query.model, connection).read(query)
      end
    end
    
    def handler_for model, connection
      handler = case model.storage_name
      when 'Campaign'       then CampaignHandler
      when 'List'           then ListHandler
      when 'Member'         then MemberHandler
      else
        raise 'Invalid Model Given: ' << model.storage_name
      end
      
      handler.new(model, connection, options)
    end
  end
end
