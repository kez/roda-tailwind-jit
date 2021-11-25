#\ -w -s puma -p 9292 -o 0.0.0.0
dev = ENV['RACK_ENV'] == 'development'

if dev
  require 'logger'
  logger = Logger.new($stdout)
end

require 'rack/unreloader'
Unreloader = Rack::Unreloader.new(subclasses: %w'Roda', logger: logger, reload: dev){App}
Unreloader.require('app.rb'){'App'}
run(dev ? Unreloader : App.freeze.app)
