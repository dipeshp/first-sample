class CommentsController < ApplicationController
  def index
    add_crumb"Users", "/users" 
    add_crumb "Show", "/users/#{params[:user_id]}"
    add_crumb "Comment Index", "/users/#{params[:user_id]}/comments"
    @user = User.find(params[:user_id])
    @comment = @user.comments
  end

  def new
    @comment = Comment.new
  end

  def show
    @c = Comment.find(params[:id])
  end
  def create
    @user = User.find(params[:user_id])
    @comment = @user.comments.create(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_path(@user) }
        flash[:notice] = "Comment Added"
      else 
        format.html { render action: "new" }
      end
    end
  end

end


