class MissionsController < ApplicationController
  def index
    render json: Mission.all
  end
end
