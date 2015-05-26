class SessionsController < ApplicationController
  def new
  end

  def create
    @account = Account.find_by(email: params[:email], password: params[:password])
    if @account.present?
      session[:id] = @account[:id]
      session[:email] = @account[:email]
      session[:user]= @account[:full_name]
      redirect_to products_path
    else
      redirect_to products_path, alert: 'invalid username or password'
    end
  end

  def destroy
    session[:id]=nil
    session[:email] = @account[:email]
    session[:user]=nil
    redirect_to products_path
  end
end
