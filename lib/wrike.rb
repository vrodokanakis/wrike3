# require 'oauth2'
require 'httparty'
require 'mime/types'

require 'wrike/error'
require 'wrike/url_helper'
require 'wrike/utils'

require 'wrike/base'
require 'wrike/account'
require 'wrike/user'
require 'wrike/workflow'
require 'wrike/contact'
require 'wrike/folder'
require 'wrike/task'
require 'wrike/comment'
require 'wrike/time_log'
require 'wrike/attachment'

require 'wrike/version'

def Wrike(options={})
  options[:client_id] = Wrike.client_id if Wrike.client_id
  options[:access_token] = Wrike.access_token if Wrike.access_token
  options[:scopes] = Wrike.scopes if Wrike.scopes
  Wrike::Base.new(options)
end