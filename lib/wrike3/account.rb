module Wrike3
  class Account
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    # Get account list
    def list(params = {})
      wrike.execute(:get, api_url('accounts'), params)
    end

    def details(id, params = {})
      wrike.execute(:get, api_url("accounts/#{id}"), params)
    end

    # Update account
    def update(id, params = {})
      wrike.execute(:put, api_url("accounts/#{id}"), params)
    end
  end
end
