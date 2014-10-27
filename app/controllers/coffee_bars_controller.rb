class CoffeeBarsController < ApplicationController

def index
		coffee_bars = CoffeeBar.all
		format.json { render :json => coffee_bars}
	end

	def show
		coffee_bar = CoffeeBar.find(params["id"])
		format.json { render :json => coffee_bar}
	end

	def create
		coffee_bar = CoffeeBar.new(params[:coffee_bar])

		if coffee_bar.save
			format.json { render :json => coffee_bar}
     else
       alert: 'Coffee bar was not saved. Please try again.'
    end

	end

	def edit
		coffee_bar = CoffeeBar.find(params["id"])
		coffee_bar.update(params[:coffee_bar])
		format.json { render :json => coffee_bar}
	end

	def destroy
		coffee_bar = CoffeeBar.find(params["id"])
		coffee_bar.destroy
		format.json { render :json => coffee_bar}
	end



end