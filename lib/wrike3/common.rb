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
  end
end