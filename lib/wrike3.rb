# require 'oauth2'
require 'httparty'
require 'mime/types'

require 'wrike3/error'
require 'wrike3/common'
require 'wrike3/utils'

require 'wrike3/base'
require 'wrike3/account'
require 'wrike3/user'
require 'wrike3/workflow'
require 'wrike3/contact'
require 'wrike3/folder'
require 'wrike3/task'
require 'wrike3/comment'
require 'wrike3/timelog'
require 'wrike3/attachment'

def Wrike3(options={})
  # Settings
  options[:scope] = Wrike3.scope if Wrike3.scope
  options[:client_id] = Wrike3.client_id if Wrike3.client_id
  options[:access_token] = Wrike3.access_token if Wrike3.access_token
  options[:client_secret] = Wrike3.client_secret if Wrike3.client_secret

  # Initialize wrike object
  Wrike3::Base.new(options)
end