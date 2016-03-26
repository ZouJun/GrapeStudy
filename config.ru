require './app'

use Rack::TryStatic, root: 'web', urls: ['/'], try: ['.html','index.html','.js','.css']

use Rack::Cors do
  allow do
    origins '*'
    resource '/*', :headers => :any, :methods => [:get, :post, :options, :put, :delete],
             :expose => %w(Content-Range Accept-Ranges), :credentials => true
  end
end

use Rack::Session::Cookie, :key => 'rack.session',
    :path => '/',
    :secret => 'rack.secret'

run App