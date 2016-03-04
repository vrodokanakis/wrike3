module Wrike3
  class Contact
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def list(options = {})
      wrike.execute(:get, api_url('contacts'), options)
    end
  end
end
