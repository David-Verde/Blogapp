class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { minimum: 2, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def recent_five_comments
    Comment.includes(:author).where(post_id: self).order('created_at DESC').limit(5)
  end

  private

  def update_post_counter
    author.increment!(:post_counter)
  end
end
