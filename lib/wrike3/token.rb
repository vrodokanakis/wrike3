module Wrike3
  class Token
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def refresh(client_id, client_secret, refresh_token)
      parameters = {
          :client_id => client_id,
          :grant_type => 'refresh_token',
          :client_secret => client_secret,
          :refresh_token => refresh_token
      }
      wrike.execute(:post, "#{Wrike3.protocol}://#{Wrike3.api_host}/oauth2/token", parameters, {}, false)
    end

  end
end
