module Wrike3
  class Error
    attr_accessor :error

    def initialize(options={})
      @error =
          case options[:code]
            when 200
              # Not an error
            when 404, 402, 403
              Wrike3::NotFound.new(options[:message])
            when 400
              Wrike3::BadRequest.new(options[:message])
            when 401
              Wrike3::Unauthorized.new(options[:message])
            when 402
              Wrike3::RequestFailed.new(options[:message])
            when 500, 502, 503, 504
              Wrike3::ServerError.new(options[:message])
            else
              Wrike3::ErrorBase.new(options[:message])
          end
    end

    def handle
      return error.handle
    end
  end

  class ErrorBase < StandardError
    # Handles the error if needed
    # by default returns an error
    #
    # @return [type] [description]
    def handle
      return self
    end
  end

  class NotFound < ErrorBase
    def handle
      return nil
    end
  end

  class BadRequest < ErrorBase
  end

  class Unauthorized < ErrorBase
  end

  class RequestFailed < ErrorBase
  end
end
