class CommentsController < ApplicationController

	def index
		comments = Comment.all
		render :json => comments
	end

	def show
		comment = Comment.find(params["id"])
		render :json => comment
	end

	def create
		comment = Comment.new(params[:comment])

		if comment.save
			render :json => comment
     else
       alert: 'Comment was not saved. Please try again.'
    end

	end

	def edit
		comment = Comment.find(params["id"])
		comment.update(params[:comment])
		render :json => comment
	end

	def destroy
		comment = Comment.find(params["id"])
		comment.destroy
		render :json => comment
	end


end