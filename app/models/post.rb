class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def update_post_counter
    author.increment!(:posts_count)
  end

  def five_most_recent_comments
    post.comments.order(created_at: :desc).limit(5)
  end

  private :update_post_counter
end
