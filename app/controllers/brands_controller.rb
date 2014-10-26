class BrandsController < ApplicationController
	def create
		brand = Brand.create({name: params["name"]})
	end
end