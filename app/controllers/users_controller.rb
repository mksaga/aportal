class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    # to see detailed information about variables, etc., decomment below:
    # debugger
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the IST Portal!"
      redirect_to @user # equivalent to: redirect_to user_url(@user)
    else
      # Show the signup form again
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                        :password_confirmation)
    end

end
