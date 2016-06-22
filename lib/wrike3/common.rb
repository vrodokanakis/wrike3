module Wrike3
  module Common
    attr_accessor :wrike

    private

    def api_url(path)
      "#{wrike.base_url}/#{path}"
    end

    def nested_path(path = '', type = nil, id = nil)
      path = "#{type}/#{id}/#{path}" if type.present? && id.present?
      path
    end

    def encode_params(parameters = {})
      parameters.each do |item|
        if item.last.is_a?(Hash) || item.last.is_a?(Array)
          parameters[item.first.to_s] = item.last.to_json
        end
      end

      parameters
    end
  end
end