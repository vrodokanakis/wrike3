module Wrike3
  class Contact
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def list(params = {})
      wrike.execute(:get, api_url('contacts'), params)
    end

    def details(ids, params = {})
      wrike.execute(:get, api_url("contacts/#{ids}"), params)
    end
  end
end
