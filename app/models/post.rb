class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end
end
