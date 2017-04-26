class SessionsController < ApplicationController
  skip_before_filter :require_login, :only=>[:new, :create]
  def new
    if current_user

      redirect_to songs_path
    else
      render "new.html.erb"
    end
  end
  def create
    @user = User.find_by(email: login_params[:email])
    if @user.try(:authenticate, login_params[:password])
      session[:user_id] = @user.id
      redirect_to '/songs'
    else
      flash[:notice] = 'invalid login'
      redirect_to :back
    end
  end

def destroy
  reset_session
  redirect_to root_path
end
private
def login_params
  params.require(:login).permit(:email, :password)
end

end
