class CommentsController < ApplicationController

	def index
		comments = Comment.all
		format.json { render :json => comments}
	end

	def show
		comment = Comment.find(params["id"])
		format.json {render :json => comment}
	end

	def create
		comment = Comment.new(params[:comment])

		if comment.save
			format.json { render :json => comment}
     else
       alert: 'Comment was not saved. Please try again.'
    end

	end

	def edit
		comment = Comment.find(params["id"])
		comment.update(params[:comment])
		format.json { render :json => comment}
	end

	def destroy
		comment = Comment.find(params["id"])
		comment.destroy
		format.json { render :json => comment}
	end


end