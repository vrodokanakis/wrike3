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
      wrike.execute(:get, api_url("folders/#{ids}"), to_j(params))
    end

    # create a folder
    def create(id, params = {})
      wrike.execute(:post, api_url("/folders/#{id}/folders"), to_j(params))
    end

    # Update a folder
    def update(id, params = {})
      wrike.execute(:put, api_url("folders/#{id}"), to_j(params))
    end

    # Delete folders and all descendants
    def delete(id, params={})
      wrike.execute(:delete, api_url("folders/#{id}"), to_j(params))
    end
  end
end
