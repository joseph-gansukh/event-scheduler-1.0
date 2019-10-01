class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Thank you for signing up!"
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to signup_path
      end
    end

    def edit
      @user = current_user
    end
    
    def update
      @user = current_user
      @user.assign_attributes(user_params)
      if @user.valid?
        @user.save
        redirect_to user_path(@user), notice: "You have successfully edited your profile"
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to edit_user_path
      end
    end

    def show
      @user = User.find_by(id: params[:id])
    end

    def attend_event
      if logged_in?
        @user = current_user
        @user.events << Event.find(params[:event_id])
        redirect_to @user
      else
        redirect_to login_path
      end
    end
    

    private

    def user_params
        params.require(:user).permit(:name, :bio, :email, :password, :password_confirmation)
    end
end
