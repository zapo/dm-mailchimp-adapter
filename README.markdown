dm-mailchimp-adapter
====================

This gem provides a Mailchimp API adapter for DataMapper 1.1.x.
It's mainly based on huminid gem: https://github.com/terra-firma/hominid

For now, it only supports very dumb reading of data, with no caching strategy (slow).
All the filtering is made thanks to DataMapper::Query#filter_records method (in memory).

As Mailchimp API xmlrpc methods names and arguments are strongly linked to resources names, CRUD operations are
delegated to resources specific handlers. 

For now only the Campain, List and Member resources handlers are provided.

For each handler we have a module Model provided which, once included, 
set up almost all existing entity properties available for its base model (no relationship are set though).

The link to the right handler is made with the model storage_name (Campaign, List, Member)

What it looks like
==================

    gem 'dm-core', '1.1.0'
    require 'dm-core'

    gem 'dm-mailchimp-adapter'
    require 'dm-mailchimp-adapter'

    require 'pp'

    DataMapper.setup(:default, 
      :adapter => 'mailchimp', 
      :api_key => '<API_KEY>', 
      :secure => true
    )

    class ChimpList
      include Mailchimp::Models::List
      storage_names[:default] = 'List'
      has n, :members, 'ChimpMember'
    end

    class ChimpMember
      include Mailchimp::Models::Member
      storage_names[:default] = 'Member'
      belongs_to :list, 'ChimpList'
    end

    class ChimpCampaign
      include Mailchimp::Models::Campaign
      storage_names[:default] = 'Campaign'
      has 1, :list, 'ChimpList'
      has n, :members, :through => :list
    end

    DataMapper.finalize

    p ChimpMember.last.list

