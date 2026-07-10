class BreedsController < ApplicationController
  def index
    @breeds = Breed.all
    if params[:query].present?
      @breeds = @breeds.where("name LIKE ?", "%#{params[:query]}%")
    end
    if params[:group_id].present?
      @breeds = @breeds.where(group_id: params[:group_id])
    end
  end

  def show
    @breed = Breed.find(params[:id])
  end
end