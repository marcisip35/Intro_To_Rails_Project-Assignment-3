class BreedsController < ApplicationController
  def index
    if params[:query].present?
      @breeds = Breed.where("name LIKE ?", "%#{params[:query]}%")
    else
      @breeds = Breed.all
    end
  end

  def show
    @breed = Breed.find(params[:id])
  end
end