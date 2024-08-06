class Api::V1::CostumesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_costume, only: [ :show, :update ]

  def index
    @costumes = policy_scope(Costume)
  end

  def show
    render json: @costume
  end

  def update
    if @costume.update(costume_params)
      render json: @costume, status: :ok
    else
      render_error
    end
  end

  private

  def set_costume
    @costume = Costume.find(params[:id])
    authorize @costume
  end

  def costume_params
    params.require(:costume).permit(:name, :category, :size)
  end

  def render_error
    render json: { errors: @costume.errors.full_messages },
      status: :unprocessable_entity
  end
end
