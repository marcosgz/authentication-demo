class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_login(params[:sessions][:login])
    if @user.present? && @user.password_correct?(params[:sessions][:password]) && @user.active?
      sign_in(@user)
      redirect_to '/'
    else
      render :action=> 'new', :status => :unauthorized
    end
  end

  def destroy
    sign_out
    redirect_to sign_in_url
  end
end