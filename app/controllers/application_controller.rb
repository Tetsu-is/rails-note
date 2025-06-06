class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user, :logged_in?

  private

  def authenticate_user
    return if session[:user_id]

    authenticate_or_request_with_http_basic do |username, password|
      user = User.find_by(name: username)
      if user && user.authenticate(password)
        session[:user_id] = user.id
        true
      else
        false
      end
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = 'ログインが必要です'
      redirect_to login_path
    end
  end
end
