require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'does not render a different template' do
      get '/users/index'
      expect(response).to_not render_template(:show)
    end
  end

  describe 'GET /show' do
    it 'does not render a different template' do
      get '/users/show'
      expect(response).to_not render_template(:index)
    end
  end

  describe 'GET /index' do
    it 'includes correct placeholder text' do
      get '/users/index'
      expect(response.body).to include('This is the index page for users.')
    end
  end

  describe 'GET /show' do
    it 'includes correct placeholder text' do
      get '/users/show'
      expect(response.body).to include('This is the show page for users.')
    end
  end
end
