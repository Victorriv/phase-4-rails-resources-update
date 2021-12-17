class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

   # PATCH /birds/:id
   def update
    #find the bird we're trying to update
    bird = Bird.find_by(id: params[:id])
    #update the bird, using data from body
    bird.update(birds_params)
    #send a response with the updated bird
    render json: bird
    
  end

  def increment_likes
    bird= Bird.find_by(id: params[:id])
    if bird 
      bird.updated(likes: bird.likes + 1)
      render json: bird
    else 
      render json: {error: "Bird no found"}, status: :not_found
    end

  end

  private

  def bird_params
    params.permit(:name, :species, :likes)
  end

end
