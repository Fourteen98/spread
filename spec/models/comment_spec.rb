require 'rails_helper'
RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'This is a comment', author_id: 1, post_id: 1) }
  before { subject.save }
  user = User.new(name: 'John', photo: 'https://usplash.com/photos/F_-0BxGuVvo', bio: 'I am a software developer',
                  post_counter: 0)
  post = Post.new(title: 'Post 1', text: 'Post 1 text', comments_counter: 0, likes_counter: 0, author_id: user)

  context 'after_save' do
    it 'should call update_comment_counter ' do
      expect(post.comments_counter).to_not eq(1)
    end
  end
end
