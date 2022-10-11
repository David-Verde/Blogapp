require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Dario')
    @id = @user.id
  end

  describe 'GET /id' do
    before(:example) { get "/users/#{@id}/posts" }

    it 'Returs http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the index view' do
      expect(response).to render_template(:index)
    end

    it 'Renders the index view template' do
      expect(response.body).to include('information')
    end
  end

  describe 'GET /show' do
    before(:example) do
      post = Post.create(title: 'Test post', text: 'Test post', author: @user)
      get "/users/#{@id}/posts/#{post.id}"
    end

    it 'Response status is correct' do
      expect(response).to have_http_status(200)
    end

    it 'Response to render show view' do
      expect(response).to render_template(:show)
    end

    it 'Response to render show view template' do
      expect(response.body).to include('Information for post')
    end
  end
end
