class SessionController < ApplicationController

	# def new
	# end

	def create
		user = User.find_by(name: params[:name])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/posts/new'
		else 

			@error = true
			redirect_to '/'
		end

	end

	def destroy
		reset_session
		redirect_to '/'
	end

end