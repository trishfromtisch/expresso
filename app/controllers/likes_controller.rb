class LikesController < ApplicationController

	def show
		likes = Like.where(post_id: params[:id])
		render :json => likes
	end

	def create
		like = Like.create({post_id: params[:post_id], user_id: session[:user_id]})
		likeTotal = Like.where({post_id: params[:post_id]})
		render :json => likeTotal
	end

	def destroy
		like = Like.find(params[:id])
		like.destroy
		render :json => like
	end

end