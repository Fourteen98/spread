class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end
end
