class ToolsController < ApplicationController
  def index
    render json: Tool.all
  end
end