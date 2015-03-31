class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
  	account = Account.find_by(email: params[:email], password: params[:password])
  	# render json: account
  	if account.present?
  		session[:id] = account[:id]
      session[:email]= account[:email]
      redirect_to products_path
  	else 
  		redirect_to products_path, alert: 'invalid username or password'
  	end
  end

  def destroy
  	session[:id]=nil
    session[:email]=nil
  	# render json: session[:id]
  	redirect_to products_path
  end
end
