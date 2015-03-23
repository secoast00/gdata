class ActorsController < ApplicationController
  before_action :set_actor, only: [:show]

  # GET /actors
  def index
    @actors = Actor.all
  end

  # GET /actors/1
  def show
  end

  # GET /actors/new
  def new
    @actor = Actor.new
  end


  # POST /actors
  def create
    @actor = Actor.new(actor_params)

    if @actor.save
      redirect_to @actor, notice: 'Actor was successfully created.'
    else
      render action: 'new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def actor_params
      params[:actor]
    end
end
