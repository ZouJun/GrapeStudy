module Toolkit
  def session
    env['rack.session']
  end

  def require_authorization!
    error! '请登录后尝试',403 unless @current_user
    # raise '请登录!' unless @current_user
  end
end