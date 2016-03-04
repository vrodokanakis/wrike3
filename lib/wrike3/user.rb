module Wrike3
  class User
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def details(id, options = {})
      wrike.execute(:get, api_url("users/#{id}"), options)
    end

    def update(id, data = {}, options = {})
      wrike.execute(:put, api_url("users/#{id}"), options.merge(data))
    end
  end
end
