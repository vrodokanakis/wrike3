module Wrike3
  class Workflow
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    # Get task list
    def list(account_id, options = {})
      wrike.execute(:get, api_url("accounts/#{account_id}/workflows"), options)
    end

    def details(account_id, id, options={})
      matters = wrike.execute(:get, api_url("accounts/#{account_id}/workflows"), options)
      matters['data'].find { |m| m['id'] == id }
    end

    # Add a new task
    def add(account_id, data = {}, options={})
      wrike.execute(:post, api_url("accounts/#{account_id}/workflows"), options.merge(data))
    end

    # Update a task
    def update(id, data = {}, options={})
      wrike.execute(:put, api_url("workflows/#{id}"), options.merge(data))
    end
  end
end
