class PostsController < ApplicationController

	def index
		@posts=Post.all
	end

	def show 
		@post=Post.find(params[:id])
		@comments=@post.comments
		@comment=Comment.new
	end

	def new 
		if !!login?
			@post=Post.new
		else 
			flash[:notice]="hey! don't cheating"
			redirect_to login_path
		end
	end

	def edit
		@post=Post.find(params[:id])
	end

	def create 
		@post=Post.new(post_params)
		@post.user_id=session[:user_id]
		
		if @post.save==true
			flash[:notice]="suscess to post"
			redirect_to root_path
		else
			redirect_to new_post_path
		end

	end

	def update
		@post=Post.find(params[:id])
		@post.update(post_params)

		redirect_to post_path(@post.id)
	end

	def destroy
		@post=Post.find(params[:id])
		@post.destroy

		redirect_to root_path

	end


	private 
		def post_params
			params.require(:post).permit(:title,:content,:user_id)
		end

end