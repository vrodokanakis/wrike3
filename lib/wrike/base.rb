module Wrike
  class Base
    def initialize(options)
      Wrike.client_id = options.fetch(:client_id) { '' }
      Wrike.access_token = options.fetch(:access_token) { '' }
      Wrike.api_version = options.fetch(:api_version) { 'v3' }
      Wrike.protocol = options.fetch(:protocol) { 'https' }
      Wrike.api_host = options.fetch(:api_host) { 'www.wrike.com' }
      Wrike.scopes = options.fetch(:scopes) { 'Default' }
    end

    # Returns the base url used in all Wrike API calls
    def base_url
      "#{Wrike.protocol}://#{Wrike.api_host}/api/#{Wrike.api_version}"
    end

    def account
      @account ||= Wrike::Account.new(self)
    end

    def attachment
      @attachment ||= Wrike::Attachment.new(self)
    end

    def comment
      @comment ||= Wrike::Comment.new(self)
    end

    def contact
      @contact ||= Wrike::Contact.new(self)
    end

    def folder
      @folder ||= Wrike::Folder.new(self)
    end

    def task
      @task ||= Wrike::Task.new(self)
    end

    def time_log
      @time_log ||= Wrike::TimeLog.new(self)
    end

    def user
      @user ||= Wrike::User.new(self)
    end

    def workflow
      @workflow ||= Wrike::Workflow.new(self)
    end
  end

  class << self
    attr_accessor :client_id,
                  :access_token,
                  :api_version,
                  :protocol,
                  :api_host,
                  :scopes

    def configure
      yield self
      true
    end

    alias :config :configure

    def execute(method, url, parameters={})
      response = HTTParty.send(method.to_s, url, query: parameters, headers: Wrike.headers)
      response.parsed_response
    end

    def headers(headers = {})
      headers.merge!('Authorization' => "Bearer #{Wrike.access_token}")
      headers
    end
  end
end
