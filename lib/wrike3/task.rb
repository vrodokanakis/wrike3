module Wrike3
  class Task
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    # Get task list
    def list(taskable_type = nil, taskable_id = nil, options = {})
      wrike.execute(:get, api_url(nested_path('tasks', taskable_type, taskable_id)), options)
    end

    def details(id, options={})
      wrike.execute(:get, api_url("tasks/#{id}"), options)
    end

    # Add a new task
    def add(folder_id, data = {}, options={})
      wrike.execute(:post, api_url("folders/#{folder_id}/tasks"), options.merge(data))
    end

    # Update a task
    def update(id, data = {}, options={})
      wrike.execute(:put, api_url("tasks/#{id}"), options.merge(data))
    end

    # Delete an existing task
    def delete(id, options={})
      wrike.execute(:delete, api_url("tasks/#{id}"), options)
    end

  end
end
