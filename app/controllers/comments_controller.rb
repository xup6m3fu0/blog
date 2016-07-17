class CommentsController < ApplicationController

	def new
		if !!login?
			@comment=Comment.new
		else
			flash[:notice]="hey! don't cheating"
			redirect_to login_path
		end
	end

	def create
		@post=Post.find(params[:post_id])
		@comment=@post.comments.new(comment_params)
		@comment.user_id=session[:user_id]

		if @comment.save==true
			redirect_to post_path(@post)
		else
			flash[:notice]="error"
			redirect_to post_path(@post)
		end
	end

	def destroy
		@post=Post.find(params[:post_id])
		@comment=@post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private
		def comment_params
			params.require(:comment).permit(:content,:user_id,:post_id)
		end

end