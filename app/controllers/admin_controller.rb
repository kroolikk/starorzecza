class AdminController < ApplicationController
  layout 'admin'
  
  before_filter :check_admin_loggedin, :except => [:login, :enter]


  def index
  end
  
  def login
  end

  def enter
    if params[:login] == "user0" && params[:password] == "star"
      session[:admin_loggedin] = true
      session[:account_type] = "Admin"
      redirect_to admin_path
    else
      flash[:alert] = "Niepoprawne dane."
      redirect_to admin_login_path
    end
  end

  def logout
    session[:logout_requested] = true
    session[:admin_loggedin] = false
    redirect_to admin_login_path
  end
  
  
  protected
  def check_admin_loggedin
    if session[:admin_loggedin] != true
      redirect_to admin_login_path
    end
  end
end
