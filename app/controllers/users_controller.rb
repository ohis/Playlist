class UsersController < ApplicationController
  skip_before_filter :require_login, :only=>[:create, :show]
  def new
  end
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to songs_path, notice: "You have been successfully registered"

    else
    
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  def show
    if current_user
      @user = User.find(params[:id])
      @playlist = Playlist.where(user:@user).group_by(&:song)
    else
      redirect_to root_path, notice: "You are not logged in"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
