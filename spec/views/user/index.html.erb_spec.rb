require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'test' do
    before(:each) do
      @user = User.create(name: 'Dario', bio: 'This is the bio',
                          photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/512/User-icon.png')
      @id = @user.id
      Post.create(author: @user, title: "Hello", text: 'This is my first post')
      visit users_path
    end

    it 'shows user name' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the Welcome title' do
      expect(page).to have_content('Welcome')
    end

    it 'shows the user photo' do
      expect(page.body).to include('https://icons.iconarchive.com/icons/iconsmind/outline/512/User-icon.png')
    end

    it 'shows number of posts user has written' do
      expect(page.body).to include('Number of posts: 1')
    end
    



  end
end