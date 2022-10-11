require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'Response status is 200' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'Renders the index view template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'Rendered view includes correct "List of users" text' do
      get users_path
      expect(response.body).to include('List of users')
    end

    it 'Returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'Renders template with correct text' do
      get '/users'
      expect(response.body).to include('Welcome')
    end

    it 'Renders template index' do
      get '/users'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'Response status is ok' do
      get users_path(1)
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the show view' do
      user = User.create(name: 'Dario')
      get "/users/#{user.id}/"
      expect(response).to render_template(:show)
    end

    it 'Renders template with correct text' do
      user = User.create(name: 'Dario')
      get "/users/#{user.id}/"
      expect(response.body).to include('User information')
    end
  end
end