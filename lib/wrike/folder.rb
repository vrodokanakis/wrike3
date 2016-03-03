module Wrike
  class Folder
    include Wrike::UrlHelper

    def initialize(wrike)
      @wrike = wrike
    end

    def tree(folderable_type = nil, folderable_id = nil, options = {})
      Wrike.execute(:get, api_url(nested_path('folders', folderable_type, folderable_id)), options)
    end

    # Get folder data
    def details(ids, options={})
      Wrike.execute(:get, api_url("folders/#{ids}"), options)
    end

    # Update a folder
    def update(id, data = {}, options={})
      Wrike.execute(:put, api_url("folders/#{id}"), options.merge(data))
    end

    # Delete folders and all descendants
    def delete(id, options={})
      Wrike.execute(:delete, api_url("folders/#{id}"), options)
    end

  end
end
