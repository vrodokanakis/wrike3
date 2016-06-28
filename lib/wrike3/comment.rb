module Wrike3
  class Comment
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    # Returns list of comments
    def list(account_id = nil, params={})
      path = 'comments'
      path = "accounts/#{account_id}/#{path}" if account_id.present?
      wrike.execute(:get, api_url(path), params)
    end

    # Returns list of comments
    def details(id, params = {})
      wrike.execute(:get, api_url("comments/#{id}"), params)
    end

    # Add a new comment to a task
    def add(commentable_type, commentable_id, params = {})
      wrike.execute(:post, api_url(nested_path('comments', commentable_type, commentable_id)), params)
    end

    # Update a comment
    def update(id, params = {})
      wrike.execute(:put, api_url("comments/#{id}"), params)
    end

    # Delete a comment
    def delete(id)
      wrike.execute(:delete, api_url("comments/#{id}"))
    end

  end
end
