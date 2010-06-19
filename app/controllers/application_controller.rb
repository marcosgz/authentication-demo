class ApplicationController < ActionController::Base
  filter_parameter_logging :password

  helper_method :current_user, :signed_in?, :signed_out?

  protected
    def signed_in?
      !current_user.nil?
    end

    def signed_out?
      current_user.nil?
    end

    def sign_out
      self.current_user = nil
    end

    def sign_in(user)
      self.current_user = user
    end

    def current_user
      session[:user] || nil
    end

    def current_user=(user)
      session[:user] = user
    end

    # before_filter :authenticate (Eg. before_filter :authenticate, :except=>[:index])
    def authenticate
      return redirect_to(sign_in_url) unless signed_in?
    end
end