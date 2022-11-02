require 'rails_helper'

RSpec.describe 'Post show test', type: :feature do
  before(:each) do
    @user1 = User.create(id: 1, name: 'Deen', photo: 'https://www.google.com/image/1', bio: 'He is Abrahas friend', post_counter: 2)
    @post = Post.create(
      author_id: @user1.id,
      title: 'Post 1',
      text: 'Rails has a lot of configuration issues :(',
      comments_counter: 0, 
      likes_counter: 0
    )
    # three comments for posts by user1
    (1...3).each do |id|
        Comment.create(
            text: "Comment #{id}",
            author_id: @user1.id,
            post_id: @post.id
        )
    end
    visit('/users/1/posts/1')
  end
