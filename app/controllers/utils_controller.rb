class UtilsController < ActionController::Base
  def deploy
    return unless params[:token] == ENV['slack_integration_token']
    Rails.logger.log 'Deploying...'
    Rails.logger.log params.inspect
  end
end
