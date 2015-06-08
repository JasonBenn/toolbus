class CompletionsController < ApplicationController
  def index
    render json: Completion.all
  end
end