class PoemsController < ApplicationController
  
  before_action :require_logged_in, only: [:index, :new, :create, :edit, :update]

  def index 
    @poems = Poem.all
    render :index
  end
  
  def new 
    @poem = Poem.new 
    render :new
  end

  def create 
    @poem = Poem.new(poem_params)
    @poem.author = current_user
    if @poem.save 
      redirect_to poems_url
    else 
      flash.now[:errors] = @poem.errors.full_messages
      render :new
    end 
  end
  
  def edit 
    @poem = current_user.poems.find_by(id: params[:id])
    render :edit
  end 

  def update 
    @poem = current_user.poems.find_by(id: params[:id])
    
    if @poem && @poem.update(poem_params)
      redirect_to poems_url
    else 
      flash[:errors] = ['Something went wrong!']
      redirect_to edit_poem_url
    end
   
  end
  
  private 
  def poem_params 
    params.require(:poem).permit(:title, :stanzas, :complete)
  end

end
