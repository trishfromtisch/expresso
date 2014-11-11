class PostsController < ApplicationController
	before_filter :check_session	

	def new
		unless current_user
  		redirect_to :action => "new", :controller => "users"
  	else
			@user = User.find_by(id: session[:user_id])
			@beverages = Beverage.all
			@brewing_methods = BrewingMethod.all
			@post = Post.new			
			render :new
		end
	end

	def location_cool

		@user = User.find_by(id: session[:user_id])
		city = URI.encode(@user.city)
		response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{city}&key=AIzaSyA6QaZLk-WITTViG0oNKQnfEQPiAGPP-eM")
		nelat = response["results"][0]["geometry"]["bounds"]["northeast"]["lat"]
		nelng = response["results"][0]["geometry"]["bounds"]["northeast"]["lng"]
		swlat = response["results"][0]["geometry"]["bounds"]["southwest"]["lat"]
		swlng = response["results"][0]["geometry"]["bounds"]["southwest"]["lng"]

		location_hash = {nelat: nelat, nelng: nelng, swlat: swlat, swlng: swlng}
		
    render :json => location_hash

	end 

	def create
  	@post = Post.new(post_params)

      if @post.save
        redirect_to "/home"
      else
        render :json => @post.errors, :status => :unprocessable_entity 
      end  
  end

  def post_params
    params.require(:post).permit(:user_id, :beverage_id, :roaster, :brewing_method_id, :coffee_bar_id, :description, :title, :coffee_rating, :avatar)
  end 

	def index
		
		@posts_array = []
		posts = Post.all
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
		# posts_with_users = posts_array.each {|post| post["username"] = post.user.name}
		# puts posts_with_users
		render :json => @posts_array
	end

	def show
		post = Post.find(params["id"])

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

	def edit
		post = Post.find(params["id"])
		post.update(params[:post])
		render :json => post
	end

	def destroy
		post = Post.find(params["id"])
		post.destroy
		render :json => post
	end

	def coveted_coffees
		coveted_coffees = CovetedCoffee.where({user_id: session[:user_id], post_id: params[:id]})
		render :json => coveted_coffees
	end

end


