module Wrike3
  class Workflow
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    # Get task list
    def list(account_id, params = {})
      wrike.execute(:get, api_url("accounts/#{account_id}/workflows"), params)
    end

    def details(account_id, id, params = {})
      matters = wrike.execute(:get, api_url("accounts/#{account_id}/workflows"), params)
      matters['data'].find { |m| m['id'] == id }
    end

    # Add a new task
    def add(account_id, params = {})
      wrike.execute(:post, api_url("accounts/#{account_id}/workflows"), params)
    end

    # Update a task
    def update(id, params = {})
      wrike.execute(:put, api_url("workflows/#{id}"), params)
    end
  end
end
