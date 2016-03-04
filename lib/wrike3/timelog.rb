module Wrike3
  class Timelog
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def list(logable_type = nil, logable_id = nil, options={})
      wrike.execute(:get, api_url(nested_path('timelogs', logable_type, logable_id)), options)
    end

    def details(id, options = {})
      wrike.execute(:get, api_url("timelogs/#{id}"), options)
    end

    # Add a new time log
    def add(task_id, data = {}, options = {})
      wrike.execute(:get, api_url("tasks/#{task_id}/timelogs"), options.merge(data))
    end

    # Update time log
    def update(id, data = {}, options={})
      wrike.execute(:put, api_url("timelogs/#{id}"), options.merge(data))
    end

    # Delete timelog
    def delete(id, options = {})
      wrike.execute(:delete, api_url("timelogs/#{id}"), options)
    end
  end
end
