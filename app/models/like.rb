class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author_id, class_name: 'User'
end
