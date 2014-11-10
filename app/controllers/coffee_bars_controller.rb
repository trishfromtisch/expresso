class CoffeeBarsController < ApplicationController

	def index
		coffee_bars = CoffeeBar.all
		render :json => coffee_bars
	end

	def show
		coffee_bar = CoffeeBar.find(params["id"])
		render :json => coffee_bar
	end

	def create
		name_and_address = params["name_and_address"]
		name = name_and_address.split(",")[0]
		address = address = name_and_address.split(",")[1, name_and_address.length - 1].join

		if CoffeeBar.where(name: name, address: address) == []
			coffee_bar = CoffeeBar.create({name: name, address: address})
			render :json => coffee_bar
		else
			coffee_bar = CoffeeBar.find_by(name: name)
			render :json => coffee_bar
		end
	end

	def edit
		coffee_bar = CoffeeBar.find(params["id"])
		coffee_bar.update(params[:coffee_bar])
		render :json => coffee_bar
	end

	def destroy
		coffee_bar = CoffeeBar.find(params["id"])
		coffee_bar.destroy
		render :json => coffee_bar
	end



end