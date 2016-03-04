module Wrike3
  class Attachment
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def list(attachable_type = nil, attachable_id = nil, options={})
      wrike.execute(:get, api_url(nested_path('attachments', attachable_type, attachable_id)), options)
    end

    # Get attachment details
    def details(id, options={})
      wrike.execute(:get, api_url("attachments/#{id}"), options)
    end
    
    # Upload attachment for specified task
    def upload(attachable_type, attachable_id, stream, options={})
      body, headers = http_multipart_data({:stream => stream})
      wrike.execute(:post, api_url(nested_path('attachments', attachable_type, attachable_id)), body, headers)
    end

    # Get file binary stream
    def download(id, options={})
      wrike.execute(:get, api_url("attachments/#{id}/download"), options)
    end

    # Delete attachments
    def delete(id, options={})
      wrike.execute(:delete, api_url("attachments/#{id}"), options)
    end
  end
end
