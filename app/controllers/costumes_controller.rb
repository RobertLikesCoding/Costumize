class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
  end

  def index
    @costumes = Costume.all
    @costume = Costume.new
    # These variables are for the search bar functionality
    @costumes = @costumes.where(category: params[:category]) if params[:category].present?
    @costumes = @costumes.where(size: params[:size]) if params[:size].present?
    @costumes = @costumes.where(available_date: params[:available_date]) if params[:available_date].present?
    # Different from the previous 3 lines so that the user needs to be able to search for any word included in the :name string
    # I changed from name LIKE to name ILIKE so that the search would be case insensitive
    @costumes = @costumes.where("name ILIKE ?", "%#{params[:name]}%") if params[:name].present?

    # Respond differently based on the request format
    respond_to do |format|
      format.html # Renders the default index.html.erb template
      format.js { render partial: 'results', locals: { costumes: @costumes } }
    end
  end

  def show
    @costume = Costume.find(params[:id])
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    if @costume.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :description, :category, :size, :price_per_day, :photo)
  end

  private

  # def set_costumes
  #   @costume = Costume.find(params[:id])
  # end

  # def costume_params
  #   params.require(:costume).permit(:name, :category, :size, :description, :price_per_day, photos: [])
  # end
end
