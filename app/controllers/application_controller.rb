class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :attending_event?
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        @current_user = nil
      end
    end

    def logged_in?
      !!current_user
    end

    def attending_event?(event_id)
      if logged_in?
        @user = current_user
        @user.events.map {|event| event.id}.include?(event_id)
      else
        nil
      end
    end
end
