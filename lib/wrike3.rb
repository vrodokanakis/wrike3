# require 'oauth2'
require 'httparty'
require 'mime/types'

require 'wrike3/error'
require 'wrike3/common'
require 'wrike3/utils'

require 'wrike3/base'
require 'wrike3/token'
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
  options[:access_token] = Wrike3.access_token if Wrike3.access_token
  # Initialize wrike object
  Wrike3::Base.new(options)
end