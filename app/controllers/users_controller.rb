class UsersController < ApplicationController

	def new
		@user=User.new
	end

	def create
		@user=User.new(user_params)

		if @user.save==true
			flash[:notice]="註冊成功"
			redirect_to root_path
		else
			puts @user.errors.full_messages
			flash[:notice]="請重新輸入"
			render new_user_path
		end
	end

	def destroy
		@user.User.find(user_params)
		@user.destroy
		redirect_to root_path
	end

	private
		def user_params
			params.require(:user).permit(:name,:password)
		end

end