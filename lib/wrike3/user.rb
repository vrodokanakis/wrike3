module Wrike3
  class User
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def details(id, params = {})
      wrike.execute(:get, api_url("users/#{id}"), params)
    end

    def update(id, params = {})
      wrike.execute(:put, api_url("users/#{id}"), params)
    end
  end
end
