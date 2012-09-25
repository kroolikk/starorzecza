if defined?(ActiveModel)
  require File.dirname(__FILE__) + '/rails/extensions/active_model'
else
  require File.dirname(__FILE__) + '/rails/extensions/active_record'
end