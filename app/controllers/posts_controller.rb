class PostsController < ApplicationController

	def new
		@user = User.find_by(id: session[:user_id])
		@beverages = Beverage.all
		@brewing_methods = BrewingMethod.all
		@post = Post.new
	end

	def location
		@user = User.find_by(id: session[:user_id])
		city = URI.encode(@user.city)
		response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{city}&key=AIzaSyBoHA1NtwkGKXR_m3wPMB6K7Fn8JqeTY-k")
		nelat = response["results"][0]["geometry"]["bounds"]["northeast"]["lat"]
		nelng = response["results"][0]["geometry"]["bounds"]["northeast"]["lng"]
		swlat = response["results"][0]["geometry"]["bounds"]["southwest"]["lat"]
		swlng = response["results"][0]["geometry"]["bounds"]["southwest"]["lng"]

		location_hash = {nelat: nelat, nelng: nelng, swlat: swlat, swlng: swlng}
		
		respond_to do |format|
    	format.json {render json: location_hash}
    end
	end 

	def create
  	@post = Post.new(post_params)

      if @post.save
        redirect_to "/home"
      else
        render json: @post.errors, status: :unprocessable_entity 
      end  
  end

  def post_params
    params.require(:post).permit(:user_id, :beverage_id, :roaster, :brew_method_id, :coffee_bar_id, :description, :title, :coffee_rating, :avatar)
  end 

	def index
		@posts = Post.all
		format.json { render :json => @posts}
	end

	def show
		post = Post.find(params["id"])
		format.json { render :json => post}
	end

	def edit
		post = Post.find(params["id"])
		post.update(params[:post])
		format.json { render :json => post}
	end

	def destroy
		post = Post.find(params["id"])
		post.destroy
		format.json { render :json => post}
	end

end


