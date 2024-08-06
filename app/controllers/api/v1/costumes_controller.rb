class Api::V1::CostumesController < Api::V1::BaseController
  before_action :set_costume, only: :show
  def index
    @costumes = policy_scope(Costume)
  end

  def show
    authorize @costume
  end

  private

  def set_costume
    @costume = Costume.find(params[:id])
  end
end
