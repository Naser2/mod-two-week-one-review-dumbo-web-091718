class SeasController < ApplicationController
  #define your controller actions here

  # resources :sea, only: :index

  def welcome
    # render :welcome
  end

  def new #render form
    @sea = Sea.new
  end


  def create
    @sea = Sea.create(sea_params)
    render "show" 
  end

  # Get - Path - Erb
  def index
      @seas = Sea.all
  end

  def show
    @sea = Sea.all.find(params[:id])
    render "show"
  end


  def edit
    @sea = Sea.all.find(params[:id])
    render :"edit.html"
  end

  def update
     @sea = Sea.find(params[:id])
     if @sea.update(sea_params)
       render "show"
     else
     render "edit"
     end
     if  @sea.destroy
      redirect_to '/seas'
    end

   end

  def destroy
     @sea = Sea.find(params[:id])
     @sea.destroy
     redirect_to '/seas'
  end

  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
