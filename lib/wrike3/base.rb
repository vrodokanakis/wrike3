module Wrike3
  class Base
    def initialize(options={})
      # API settings
      Wrike3.api_version = options.fetch(:api_version) { 'v3' }
      Wrike3.protocol = options.fetch(:protocol) { 'https' }
      Wrike3.api_host = options.fetch(:api_host) { 'www.wrike.com' }
      # Access settings
      Wrike3.access_token = options.fetch(:access_token) { '' }
    end

    def site_url
      "#{Wrike3.protocol}://#{Wrike3.api_host}"
    end

    # Returns the base url used in all Wrike API calls
    def base_url
      "#{site_url}/api/#{Wrike3.api_version}"
    end

    def account
      @account ||= Wrike3::Account.new(self)
    end

    def attachment
      @attachment ||= Wrike3::Attachment.new(self)
    end

    def comment
      @comment ||= Wrike3::Comment.new(self)
    end

    def contact
      @contact ||= Wrike3::Contact.new(self)
    end

    def folder
      @folder ||= Wrike3::Folder.new(self)
    end

    def task
      @task ||= Wrike3::Task.new(self)
    end

    def timelog
      @timelog ||= Wrike3::Timelog.new(self)
    end

    def user
      @user ||= Wrike3::User.new(self)
    end

    def workflow
      @workflow ||= Wrike3::Workflow.new(self)
    end

    def token
      @token ||= Wrike3::Token.new(self)
    end

    def auth_headers(options = {})
      options.merge!('Authorization' => "Bearer #{Wrike3.access_token}")
      options
    end

    def execute(method, url, parameters = {}, request_headers = {}, include_auth_header = true)
      request_headers = self.auth_headers(request_headers) if include_auth_header
      response = HTTParty.send(method.to_s, url, query: parameters, headers: request_headers)
      response.parsed_response
    end
  end

  class << self
    attr_accessor :api_host,
                  :protocol,
                  :api_version,
                  :access_token

    def configure
      yield self
      true
    end

    alias :config :configure
  end
end
