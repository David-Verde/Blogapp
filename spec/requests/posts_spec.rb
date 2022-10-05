require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /id' do
    it 'returns http success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:ok)
    end
  end

  it 'Renders the index view' do
    get '/users/:user_id/posts'
    expect(response).to render_template(:index)
  end

  it 'Renders the show view' do
    get '/users/:user_id/posts/:id'
    expect(response).to render_template(:show)
  end

  it 'Returns http success' do
    get '/users/id'
    expect(response).to have_http_status(:success)
  end

  it 'Renders template with correct text' do
    get '/users'
    expect(response.body).to include('Users index view')
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
    get '/users/1/posts/1'
    expect(response).to render_template(:show)
  end
end
