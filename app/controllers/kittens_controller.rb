class KittensController < ApplicationController
  before_action :get_kitten, only: [:show, :update, :edit, :destroy]

  def index
    @kittens = Kitten.all
    respond_to do | format |
      format.html
      format.json { render json: @kittens }
    end
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = 'Your account is registered.'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def show
    respond_to do | format |
      format.html
      format.json { render json: @kitten }
    end
  end

  def update
    @Kitten = Kitten.find_by(kitten_params)
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Your acccount is updated."
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    Kitten.find(params[:id]).destroy
    flash[:success] = "Your kitty has veen deleted"
    redirect_to root_url
  end

private

  def get_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
