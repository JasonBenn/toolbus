require 'rails_helper'

RSpec.describe ToolsController, type: :controller do
  it '#index renders template' do
    get :index
    expect(response).to render_template(:index)
  end

  it '#show renders template' do
    tool = FactoryGirl.build(:tool)
    tool.save
    get :show, id: tool.id
    expect(response).to render_template(:show)
  end
end
