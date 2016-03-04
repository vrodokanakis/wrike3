module Wrike3
  class Comment
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    # Returns list of comments
    def list(account_id = nil, options={})
      path = 'comments'
      path = "accounts/#{account_id}/#{path}" if account_id.present?
      wrike.execute(:get, api_url(path), options)
    end

    # Returns list of comments
    def details(id, options={})
      wrike.execute(:get, api_url("comments/#{id}"), options)
    end

    # Add a new comment to a task
    def add(commentable_type, commentable_id, data = {}, options={})
      wrike.execute(:post, api_url(nested_path('comments', commentable_type, commentable_id)), options.merge(data))
    end

    # Update a comment
    def update(id, data = {}, options={})
      wrike.execute(:put, api_url("comments/#{id}"), options.merge(data))
    end

    # Delete a comment
    def delete(id)
      wrike.execute(:delete, api_url("comments/#{id}"), options)
    end

  end
end
