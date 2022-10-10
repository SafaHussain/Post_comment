class PostsController < ApplicationController
    load_and_authorize_resource
    
    def index
        if current_user.role == "admin"
            @posts = Post.all
        else
        @posts = current_user.posts
         end
    end
    
    def new
        @post = Post.new
    end
    
    def create 
        @user = current_user
         @post = Post.new(post_params)
        @post.user_id=current_user.id
        if @post.save
            UserMailer.with(user: @user).post_status.deliver_now
            flash[:notice]="Post is successfully added."
            redirect_to post_path(@post)
        else
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
    end
    
    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
          if @post.update(post_params)
            flash[:notice]="Post updated successfully."
            redirect_to post_path(@post)
        else
            render 'edit'
        end 
    end
    
    def approve
        @post = Post.find(params[:id])
        @post.update(status: "approved")
        redirect_to 'http://localhost:3000/admin/post/'
    end    
    
    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
        flash[:notice] ="Post deleted successfully."
        redirect_to posts_path
        else 
       flash[:notice] ="Post couldn't be deleted!."
        end   
    end 

    private
    def post_params
        params.require(:post).permit(:title, :description, images: [])
    end
end
   #  @posts = Post.all