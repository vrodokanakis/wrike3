module Wrike
  class Contact
    include Wrike::UrlHelper

    def initialize(wrike)
      @wrike = wrike
    end

    def list(options = {})
      Wrike.execute(:get, api_url('contacts'), options)
    end
  end
end
