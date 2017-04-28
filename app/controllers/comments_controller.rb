class CommentsController < ApplicationController

before_action :find_message
before_action :find_comment, only: [:edit, :update, :destroy]
# def new    
# end

def create
       #POST   /messages/:message_id/comments(.:format)          comments#create
  #@message = Message.find(params[:message_id])
  @comment = @message.comments.create(comment_params)
  @comment.user_id = current_user.id

  if @comment.save
      redirect_to message_path(@message)
  else
      render 'new'    
  end    
end

def edit
end

def update
    if @comment.update
       redirect_to message_path(@mssage)
    else   
       render 'edit'
    end
end

def destroy
    @comment.destroy
    redirect_to message_path(@mssage)
end
private

def find_message
  @message = Message.find(params[:message_id])
end

def find_comment
  @comment = @message.comments.find(params[:message_id])
end

def comment_params
    params.require(:comment).permit(:content,:user_id,:message_id)
end

end