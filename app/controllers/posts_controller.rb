class PostsController < ApplicationController

	def new
		@user = User.find_by(id: session[:user_id])
		@beverages = Beverage.all
		@brewing_methods = BrewingMethod.all
		@post = Post.new
	end

	def create
		binding.pry
  @post = Post.new(post_params)

      if @post.save
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end  
  end

  def post_params
    params.require(:post).permit(:user_id, :beverage_id, :roaster, :brew_method_id, :description, :title, :coffee_rating, :avatar)
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

