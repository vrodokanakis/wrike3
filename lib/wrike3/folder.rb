module Wrike3
  class Folder
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def tree(folderable_type = nil, folderable_id = nil, options = {})
      wrike.execute(:get, api_url(nested_path('folders', folderable_type, folderable_id)), options)
    end

    # Get folder data
    def details(ids, params={})
      wrike.execute(:get, api_url("folders/#{ids}"), encode_params(params))
    end

    # create a folder
    def create(id, params = {})
      wrike.execute(:post, api_url("/folders/#{id}/folders"), encode_params(params))
    end

    # Update a folder
    def update(id, params = {})
      wrike.execute(:put, api_url("folders/#{id}"), encode_params(params))
    end

    # Delete folders and all descendants
    def delete(id, params={})
      wrike.execute(:delete, api_url("folders/#{id}"), encode_params(params))
    end

  end
end
