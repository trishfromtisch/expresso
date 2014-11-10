class CovetedCoffeesController < ApplicationController

	def index
		@user = User.find_by(id: session[:user_id])

		if @user
			coveted_coffees = CovetedCoffee.where(user_id: @user.id)
			render :json => coveted_coffees
		else
			redirect_to '/'
		end
			
	end

	def show
		coveted_coffee = CovetedCoffee.find(params["id"])
		render :json => comment
	end

	def create
		coveted_coffee = CovetedCoffee.new(params[:coveted_coffee])

		if coveted_coffee.save
			render :json => coveted_coffee
     else
       alert: 'Covet was not saved. Please try again.'
    end

	end

	def edit
		coveted_coffee = CovetedCoffee.find(params["id"])
		coveted_coffee.update(params[:coveted_coffee])
		render :json => coveted_coffee
	end

	def destroy
		coveted_coffee = CovetedCoffee.find(params["id"])
		coveted_coffee.destroy
		render :json => coveted_coffee
	end


end