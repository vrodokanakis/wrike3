module Wrike3
  class Contact
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def list(options = {})
      wrike.execute(:get, api_url('contacts'), options)
    end

    def details(ids, options = {})
      wrike.execute(:get, api_url("contacts/#{ids}"), options)
    end
  end
end
