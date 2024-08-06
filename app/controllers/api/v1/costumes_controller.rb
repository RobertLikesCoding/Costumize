class Api::V1::CostumesController < Api::V1::BaseController
  def index
    @costumes = policy_scope(Costume)
  end
end
