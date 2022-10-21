require 'rails_helper'
RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'This is a comment', author_id: 1, post_id: 1) }
  before { subject.save }
  before(:each) do
    User.create(name: 'John', photo: 'https://usplash.com/photos/F_-0BxGuVvo', bio: 'I am a software developer', post_counter: 0)
    Post.create(title: 'Post 1', text: 'Post 1 text', comments_counter: 0, likes_counter: 0, author_id: 1)
  end
  context 'update_comment_counter' do
    # it 'should update the post comments_counter' do
    #   expect(subject.update_comment_counter).to_not eq(Post.comments.count > 0)
    # end
  end
end