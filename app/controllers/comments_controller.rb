class CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end

    def new
      @comment = Comment.new
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save
            respond_to do|format|
                format.js {render :layout => false }
            end
         
    end
    def show 
        @comment = Comment.find(params[:id])
        # @comments = @post.comments
    end 
    def edit
       @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        # @post = @comment.post
        
    end
    def update
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)

            flash[:notice]="Comment updated."
            redirect_to post_path(params[:post_id])
        else
        
            flash[:notice]="Comment not updated."
            render 'edit'
        end
    end
    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            flash[:notice]="Comment deleted."
            redirect_to post_path(params[:post_id])
        else
            flash[:notice]="Comment not deleted."
            redirect_to comments_path
        end
    end
    private
    def comment_params
        params.require(:comment).permit(:description, :post_id, :rating)
    end
end