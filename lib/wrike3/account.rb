module Wrike3
  class Account
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    # Get account list
    def list(options = {})
      wrike.execute(:get, api_url('accounts'), options)
    end

    def details(id, options={})
      wrike.execute(:get, api_url("accounts/#{id}"), options)
    end

    # Update account
    def update(id, data = {}, options={})
      wrike.execute(:put, api_url("accounts/#{id}"), options.merge(data))
    end
  end
end
