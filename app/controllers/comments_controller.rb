class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post

    def create
        @comment = @post.comments.create(comment_params)
        @comment.user = current_user

        if @comment.save
            flash[:notice] = "Comment has been created"
            redirect_to post_path(@post)
        else
            flash[:alert] = "Comment has not been created"
            redirect_to post_path(@post)
        end

    end    

    def destroy
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        # redirecting the user to the page with the details of the newly created post
        redirect_to post_path(@post)
    end 

    

    private
    def set_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:body)
    end 
end
