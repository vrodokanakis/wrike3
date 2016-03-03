# Wrike

This gem is to communicate through Wrike.com API


## Installation

Add to your Gemfile:

<pre><code>gem 'wrike3', :github => 'morshedalam/wrike3'</code></pre>

Then run:

<pre>$ bundle install</pre>


## Usage

We mimic the ActiveRecord-style interface.


#### Configuration
```ruby
# Initialize your Wrike object:
Wrike.configure do |config|
  config.client_id = 'client-id'
  config.access_token  = 'access-token'
end

@wrike = Wrike()

# or alternatively:
@wrike = Wrike(:client_id => 'client-id')
