class CoffeeBarsController < ApplicationController

def index
		coffee_bars = CoffeeBar.all
		respond_to do |format|
		format.json {render :json => coffee_bars}
		end
	end

	def show
		coffee_bar = CoffeeBar.find(params["id"])
		respond_to do |format|
			format.json { render :json => coffee_bar}
		end
	end

	def create
		name_and_address = params["name_and_address"]
		name = name_and_address.split(",")[0]
		address = address = name_and_address.split(",")[1, name_and_address.length - 1].join

		if CoffeeBar.where(name: name, address: address) == []
			coffee_bar = CoffeeBar.create({name: name, address: address})
				respond_to do |format|
					format.json { render :json => coffee_bar}
				end
		else
			coffee_bar = CoffeeBar.find_by(name: name)
				respond_to do |format|
					format.json { render :json => coffee_bar}
				end
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