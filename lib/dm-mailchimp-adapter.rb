require 'dm-core'
require 'dm-types'
require 'dm-validations'
require 'hominid'
require 'logger'

module Mailchimp
  class Adapter < ::DataMapper::Adapters::AbstractAdapter
    Inflector = ::DataMapper::Inflector
  end
  
  LOGGER = Logger.new(DataMapper.logger.log)
  LOGGER.progname = 'MailchimpAdapter'
end

require 'dm-mailchimp-adapter/version'
require 'dm-mailchimp-adapter/models'
require 'dm-mailchimp-adapter/resources_handlers'
require 'dm-mailchimp-adapter/adapter'


::DataMapper::Adapters::MailchimpAdapter = Mailchimp::Adapter
::DataMapper::Adapters.const_added(:MailchimpAdapter)