require 'rails_helper'

RSpec.describe 'Post show test', type: :feature do
  describe 'Show', bullet: :skip do
    before(:example) do
      @user1 = User.create(id: 1, name: 'Deen', photo: 'https://www.google.com/image/1', bio: 'He is Abrahas friend',
                           post_counter: 2)
      @post = Post.create(id: 1, title: 'Rails Magic', text: 'Rails has a lot of configuration issues :(',
                          comments_counter: 0, likes_counter: 0, author_id: @user1.id)
      # three comments for posts by user1
      (1...3).each do |id|
        Comment.create(
          text: "This is comment #{id}",
          author_id: 1,
          post_id: 1
        )
      end
      visit '/users/1/posts/1'
    end
    it 'should show post title' do
      expect(page).to have_content('Rails Magic')
    end
    it 'should show the author of the post' do
      expect(page).to have_content('Deen')
    end
    it 'should show comment count' do
      expect(page).to have_content('Number of comments: 2')
    end
    it 'should show likes count' do
      expect(page).to have_content('Number of likes: 0')
    end
    it 'should show commentor name' do
      expect(page).to have_content('Deen')
    end
    it 'should show the comment by the commentor' do
      expect(page).to have_content('This is comment')
    end
  end
end
