module Wrike3
  class Task
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    # Get task list
    def list(taskable_type = nil, taskable_id = nil, params = {})
      wrike.execute(:get, api_url(nested_path('tasks', taskable_type, taskable_id)), params)
    end

    def details(id, params = {})
      wrike.execute(:get, api_url("tasks/#{id}"), params)
    end

    # Add a new task
    def add(folder_id, params = {})
      wrike.execute(:post, api_url("folders/#{folder_id}/tasks"), params)
    end

    # Update a task
    def update(id, params = {})
      wrike.execute(:put, api_url("tasks/#{id}"), params)
    end

    # Delete an existing task
    def delete(id, params = {})
      wrike.execute(:delete, api_url("tasks/#{id}"), params)
    end

  end
end
