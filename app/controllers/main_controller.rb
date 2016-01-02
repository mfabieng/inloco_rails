class MainController < ApplicationController

	before_action :authenticate_user!, only: [:home] # home necessita de usuário logado para acesso
  def index
  end

  def home
  end

  def confirmaemail

  	if(params.has_key?(:email))
	  	conn = ActiveRecord::Base.connection

		result = conn.execute "UPDATE users SET confirmed_at = NOW() WHERE email like '"+ params[:email] + "';"
  	end
  end
end
