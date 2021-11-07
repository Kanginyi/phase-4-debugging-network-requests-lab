class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create(toy_params)
    if toy.valid?
      render json: toy, status: :created
    else
      render json: { errors: toy.errors }, status: :unprocessable_entity
    end
  end

  def update
    toy = Toy.find_by(id: params[:id])
    toy.update(toy_params)
    if toy.valid?
      render json: toy, status: :ok
    else 
      render json: { errors: toy.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
