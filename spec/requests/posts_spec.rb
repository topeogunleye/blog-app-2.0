require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get 'http://127.0.0.1:3000/users/1/posts/1'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'does not render a different template' do
      get '/users/1/posts'
      expect(response).to_not render_template(:show)
    end
  end

  describe 'GET /show' do
    it 'does not render a different template' do
      get '/users/1/posts/1'
      expect(response).to_not render_template(:index)
    end
  end

  describe 'GET /index' do
    it 'includes correct placeholder text' do
      get '/users/1/posts'
      expect(response.body).to include('This is the index page for posts.')
    end
  end

  describe 'GET /show' do
    it 'includes correct placeholder text' do
      get '/users/1/posts/1'
      expect(response.body).to include('This is the show page for posts.')
    end
  end
  
end
