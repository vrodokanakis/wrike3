module Wrike3
  class Attachment
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def list(attachable_type = nil, attachable_id = nil, params = {})
      wrike.execute(:get, api_url(nested_path('attachments', attachable_type, attachable_id)), params)
    end

    # Get attachment details
    def details(id, params = {})
      wrike.execute(:get, api_url("attachments/#{id}"), params)
    end
    
    # Upload attachment for specified task
    def upload(attachable_type, attachable_id, stream)
      body, headers = http_multipart_data({:stream => stream})
      wrike.execute(:post, api_url(nested_path('attachments', attachable_type, attachable_id)), body, headers)
    end

    # Get file binary stream
    def download(id, params = {})
      wrike.execute(:get, api_url("attachments/#{id}/download"), params)
    end

    # Delete attachments
    def delete(id, params = {})
      wrike.execute(:delete, api_url("attachments/#{id}"), params)
    end
  end
end
