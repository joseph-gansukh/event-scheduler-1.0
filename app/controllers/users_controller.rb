class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Thank you for signing up!"
      else
        redirect_to signup_path
      end
    end

    def show
      @user = User.find_by(id: params[:id])
    end

    def add_event
      
    end

    private

    def user_params
        params.require(:user).permit(:name, :bio, :email, :password, :password_confirmation)
    end
end
