class CommentsController < ApplicationController
  def create
    comment = Comment.create(params_method)
    if comment.save
      redirect_to prototype_path(comment.prototype_id)
    else
      render prototype_path
    end
  end


  private
  def params_method
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, user_name: current_user.name, prototype_id: params[:prototype_id])
  end  
end
