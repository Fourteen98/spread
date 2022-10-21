require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John', photo: 'https://usplash.com/photos/F_-0BxGuVvo', bio: 'I am a software developer', post_counter: 0) }
  before { subject.save }
  context 'name' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  
    it 'name should be empty' do
      subject.name = ''
      expect(subject).to_not be_valid
    end
  end

  context 'post_counter' do
    it 'post_counter should be greater than or equal to 0' do
      subject.post_counter = nil
      expect(subject).to_not be_valid
    end

    it 'post_counter should be a number' do
      subject.post_counter = 'a'
      expect(subject).to_not be_valid
    end
  end

  context 'recent_posts' do
    before(:each) do
      3.times do |i|
        Post.new(title: "Post #{i}", text: "Post #{i} text", comments_counter: 0, likes_counter: 0, author_id: subject.id)
      end
    end
    it 'should return the 3 most recent posts' do
      expect(subject.recent_posts.count).to eq(Post.last(3).count)
    end
  end
end
