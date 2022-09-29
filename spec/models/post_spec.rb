require 'rails_helper'

RSpec.describe Post, type: :model do
  # Create post

  subject { Post.new(title: 'Post title', author: User.new(name: 'david')) }

  it 'should not allow empty title' do
    expect(subject).to be_valid
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should not allow title shorter than 3 characters' do
    expect(subject).to be_valid
    subject.title = 'ab'
    expect(subject).to_not be_valid
  end

  it 'should not allow title longer than 250 characters' do
    expect(subject).to be_valid
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'should not allow comments_counter to be negative' do
    expect(subject).to be_valid
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should not allow comments_counter to be a string' do
    expect(subject).to be_valid
    subject.comments_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'FiveMostRecentComments returns the five most recent comments' do
    expect(subject.five_most_recent_comments.length).to be_between(0, 5)
  end

  it 'UpdatePostCounter increments post_counter' do
    expect(subject.author.post_counter).to be 0
    subject.save
    expect(subject.author.post_counter).to be 1
  end
  
end
