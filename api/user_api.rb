# coding: UTF-8
class UserApi < Grape::API
  helpers ::Toolkit
  prefix :user

  resources 'register' do
    post do
      user = User.new
      user.register(params[:username], params[:name], params[:password], params[:email], params[:gender])
    end

  end

  resources 'login' do
    post do
      user = User.new
      session['current_user'] = user.login(params[:username], params[:password])
    end
  end

  resources 'logout' do
    post do
      session['current_user'] = nil
    end
  end

  resources 'update_user' do
    post do
      require_authorization!
      user = User.new
      user.update_user(params[:username], params[:old_password], params[:name], params[:new_password], params[:email], params[:gender])
    end
  end

  resources 'current_user' do
    get do
      @current_user
    end
  end

end