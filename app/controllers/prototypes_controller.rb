class PrototypesController < ApplicationController

before_acton :authenticate_user!, only: :[new, :edit, :destory]

def index
  @prototypes = Prototype.all
end

def new
  @prototype = Prototype.new
end

def create
  if
  Prototype.create(strong_method)
    redirect_to root_path
  else
    render :new
  end
end

def show
  @prototype = Prototype.find(params[:id])
  @comment = Comment.new
  @comments = @prototype.comments.includes(:user)
end  

def destroy
  prototype = Prototype.find(params[:id])
  prototype.destroy
end

def edit
  @prototype = Prototype.find(params[:id])
  unless current_user == @prototype.user
    redirect_to root_path
  end  
end

def update
  prototype = Prototype.find(params[:id])
  if prototype.update(strong_method)
    redirect_to prototype_path
  else
    render :edit
  end
end

private 
def strong_method
params.require(:prototype).permit(:title, :catch_copy, :concept, :image, :id).merge(user_id:current_user.id, user_name:current_user.name)
end

end
