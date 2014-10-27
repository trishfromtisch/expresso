class WelcomeController < ApplicationController
	def index
		render :index
	end

	def home
		
		@user = User.find_by(id: session[:user_id])

		if @user
			render :home
		else
			redirect_to '/'
		end
		
	end
end