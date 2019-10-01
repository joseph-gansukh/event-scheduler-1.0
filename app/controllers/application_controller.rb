class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :attending_event?, :myself?, :friend?
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
      end
    end

    def myself?(user_id)
      current_user.id == user_id
    end

    def friend?(friend_id)
      @user = current_user
      @user.friends.include?(User.find(friend_id))
    end
    
end
