class AchievementsController < ApplicationController
  def index
    render json: Achievement.all
  end
end
