class SessionsController < ApplicationController
  def login
  	@user = User.find_by email: params[:email]
  	flash[:errors] = []
  	unless @user 
  		flash[:errors].push 'Invalid email'
  		redirect_to :back
  	else 
      if @user.authenticate(params[:password])
      	session[:user_id] = @user.id
      	redirect_to organizations_path
      else
      	flash[:errors].push 'Invalid password'
      	redirect_to :back
      end
    end
  end

  def logout
  	session[:user_id] = false
  	redirect_to main_path
  end
end
