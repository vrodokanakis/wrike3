module Wrike
  class User
    include Wrike::UrlHelper

    def initialize(wrike)
      @wrike = wrike
    end

    def details(id, options = {})
      Wrike.execute(:get, api_url("users/#{id}"), options)
    end

    def update(id, data = {}, options = {})
      Wrike.execute(:put, api_url("users/#{id}"), options.merge(data))
    end
  end
end
