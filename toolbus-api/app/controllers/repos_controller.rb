class ReposController < ApplicationController
  def index
    render json: Repo.all
  end
end