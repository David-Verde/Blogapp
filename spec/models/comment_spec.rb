require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'Dario')
  post = Post.new(title: 'example', text: 'example', author: user)
  comment = Comment.new(author: user, post:)

  it 'comment is not valid without author' do
    comment.author = nil
    expect(comment).to_not be_valid
  end

  it 'comment is not valid without post' do
    comment.post = nil
    expect(comment).to_not be_valid
  end
end
