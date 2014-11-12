class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
  	@user = User.new(user_params)

      if @user.save     	
        flash[:notice] = "welcome, please login."
        redirect_to "/" 
        # format.json { render action: 'show', status: :created, location: @user }
      else
        render action: 'new' 
      end
  end

  def user_params
    params.require(:user).permit(:avatar, :name, :email, :full_name, :city, :password, :password_confirmation)
  end

	def index
		users = User.all
		respond_to do |format|
			format.html {render :new}
			format.json { render :json => users}
		end
	end

	def edit
		user = User.find(params["id"])
		user.update(params[:user])
		
		render :json => user
	end

	def show
		user = User.find(params["id"])
		render :json => user
	end

	def destroy
		user = User.find(params["id"])
		user.destroy
		render :json => user
	end

end