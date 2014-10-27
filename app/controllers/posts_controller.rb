class PostsController < ApplicationController

	def index
		posts = Post.all
		format.json { render :json => posts}
	end

	def show
		post = Post.find(params["id"])
		format.json { render :json => post}
	end

	def create
		post = Post.new(params[:post])

		if post.save
			format.json { render :json => post}
     else
       alert: 'Post was not saved. Please try again.'
    end

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

