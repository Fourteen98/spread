class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  validate :title, presence: true, length:{maximum: 250}
  validate :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validate :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end
end
