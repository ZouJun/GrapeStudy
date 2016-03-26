require 'bundler'
require 'json'
require 'active_record'
Bundler.require :default

Dir.glob("#{__dir__}/helpers/*.rb").each { |file| require file }
Dir.glob("#{__dir__}/models/*.rb").each { |file| require file }
Dir.glob("#{__dir__}/api/*_api.rb").each { |file| require file }

class App < Grape::API
  include Grape::ActiveRecord::Extension
  format :json
  helpers ::Toolkit

  rescue_from :all do |e|
    error_response status: 500, message: {message: e.message}.to_json
  end

  after_validation do
    @current_user = session['current_user']
  end

    mount UserApi
    mount ArticleApi
    mount CommentApi
  end
