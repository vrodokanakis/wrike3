module Wrike
  class Account
    include Wrike::UrlHelper

    def initialize(wrike)
      @wrike = wrike
    end

    # Get account list
    def list(options = {})
      Wrike.execute(:get, api_url('accounts'), options)
    end

    def details(id, options={})
      Wrike.execute(:get, api_url("accounts/#{id}"), options)
    end

    # Update account
    def update(id, data = {}, options={})
      Wrike.execute(:put, api_url("accounts/#{id}"), options.merge(data))
    end
  end
end
