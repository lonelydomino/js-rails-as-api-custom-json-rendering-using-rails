

class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    render json: birds, only: [:id, :name, :species]
    # render json: birds, except: [:created_at, :updated_at]
    # render json: birds.to_json(except: [:created_at, :updated_at])

  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird
    #render json: {id: bird.id, name: bird.name, species: bird.species } 
    # render json: bird.slice(:id, :name, :species)
    #slice doesnt work for an array of hashes like in index
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
end