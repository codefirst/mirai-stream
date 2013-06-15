Devise.setup do |config|
  require 'devise/orm/active_record'
  config.sign_out_via = :delete
  config.omniauth :flickr, ENV['FLICKR_APP_KEY'], ENV['FLICKR_SECRET'], scope: 'read'
end
