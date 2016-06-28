module Wrike3
  class Timelog
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def list(logable_type = nil, logable_id = nil, params = {})
      wrike.execute(:get, api_url(nested_path('timelogs', logable_type, logable_id)), params)
    end

    def details(id, params = {})
      wrike.execute(:get, api_url("timelogs/#{id}"), params)
    end

    # Add a new time log
    def add(task_id, params = {})
      wrike.execute(:get, api_url("tasks/#{task_id}/timelogs"), params)
    end

    # Update time log
    def update(id, params = {})
      wrike.execute(:put, api_url("timelogs/#{id}"), params)
    end

    # Delete timelog
    def delete(id, params = {})
      wrike.execute(:delete, api_url("timelogs/#{id}"), params)
    end
  end
end
