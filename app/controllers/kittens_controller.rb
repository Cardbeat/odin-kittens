class KittensController < ApplicationController
  def index
    @Kittens = Kitten.all
    respond_to do | format |
      format.html
      format.json { render :json => @kittens }
    end
  end

  def create
    @Kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = 'Your account is registered.'
      redirect_to root_url
    else
      render new_path
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find_by(id: params[:id])
  end

  def show
    @kitten = Kitten.find_by(id: params[id])
    respond_to do | format |
      format.html
      format.json { render :json => @kitten }
    end
  end

  def update
    @Kitten = Kitten.find_by(id: params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Your acccount is updated."
      redirect_to root_url
    else
      render new_path
  end

  def destroy
    Kitten.find(params[:id]).destroy
    flash[:success] = "Your kitty has veen deleted"
    redirect_to kittens_path
  end

private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
