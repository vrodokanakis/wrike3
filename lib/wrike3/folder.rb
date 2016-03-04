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
    def details(ids, options={})
      wrike.execute(:get, api_url("folders/#{ids}"), options)
    end

    # Update a folder
    def update(id, data = {}, options={})
      wrike.execute(:put, api_url("folders/#{id}"), options.merge(data))
    end

    # Delete folders and all descendants
    def delete(id, options={})
      wrike.execute(:delete, api_url("folders/#{id}"), options)
    end

  end
end
