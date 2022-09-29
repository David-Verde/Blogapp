class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_post_counter

  def update_post_counter
    author.increment!(:posts_count)
  end

  def five_most_recent_comments
    post.comments.order(created_at: :desc).limit(5)
  end

  private :update_post_counter
end
