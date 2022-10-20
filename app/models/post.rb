class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def recent_comments
    comments.order(created_at: :desc).limit(3)
  end
end
