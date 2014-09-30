class PostsController < ApplicationController

	def index
		@user = User.find(session[:user_id])
		@posts = Post.where(user_id: session[:user_id])
	end

	def show
		@post = Post.find(params[:id]) if params[:id]
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])
		if @post.update(params[:post])
			flash[:notice] = 'New Post created.'
		else
			flash[:alert] = 'Post not created.'
		end
	end

	def edit
		@post = Post.find(params[:id]) if params[:id]
	end

	def update
		@post = Post.find(params[:id]) if params[:id]
		if @post.update(params[:post])
			flash[:notice] = 'Post edited.'
			redirect_to user_posts_path
		else
			flash[:notice] = 'Edit incomplete.'
			redirect_to user_posts_path
		end
	end

	def destroy
		@post = Post.find(params[:id])

		if @post.destroy
			flash[:notice] = 'User successfully deleted.'
		else
			flash[:alert] = 'User delete not successful.'
		end

		redirect_to user_posts_path
		
	end

end