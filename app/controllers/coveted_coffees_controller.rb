class CovetedCoffeesController < ApplicationController

	def index
		
			coveted_coffees = CovetedCoffee.where(user_id: @user.id)
			posts = []
			coveted_coffees.each do |coveted_coffee|
				posts << Post.find(id: coveted_coffee.post_id)
			end

			@posts_array = []

			posts.each do |post|
				hash = {} 
				hash[:id] = post.id
				hash[:beverage] = post.beverage.name
				hash[:username] = post.user.name
				hash[:coffee_bar] = post.coffee_bar.name
				hash[:roaster] = post.roaster
				hash[:brewing_method] = post.brewing_method.name
				hash[:description] = post.description
				hash[:title] = post.title
				hash[:coffee_rating] = post.coffee_rating
				hash[:avatar] = post.avatar
				hash[:created_at] = post.created_at.strftime("%a, %b %e %Y")
				@posts_array << hash
			end

			render :json => @posts_array
			
	end

	def show
		coveted_coffee = CovetedCoffee.find(params["id"])
		post = Post.find(coveted_coffee.post_id)
		@post = {}
		@post[:id] = post.id
		@post[:beverage] = post.beverage.name
		@post[:username] = post.user.name
		@post[:coffee_bar] = post.coffee_bar.name
		@post[:coffee_bar_id] = post.coffee_bar_id
		@post[:roaster] = post.roaster
		@post[:brewing_method] = post.brewing_method.name
		@post[:description] = post.description
		@post[:title] = post.title
		@post[:coffee_rating] = post.coffee_rating
		@post[:avatar] = post.avatar
		@post[:created_at] = post.created_at.strftime("%a, %b %e %Y")

		render :json => @post
	end

	def create

			coveted_coffee = CovetedCoffee.create({user_id: session[:user_id], post_id: params[:post_id]})
	    
	    render :json => coveted_coffee
	    
	end

	def destroy
		coveted_coffee = CovetedCoffee.find(params["id"])
		coveted_coffee.destroy
		render :json => coveted_coffee
	end


end