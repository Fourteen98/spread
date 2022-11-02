require 'rails_helper'

RSpec.describe 'Post index test', type: :feature do
  describe 'post' do
    before(:example) do
      @user1 = User.create(id: 1, name: 'Tom', photo: 'https://www.google.com/image/1', bio: 'He is Abrahas friend', post_counter: 2)
      @post1 = Post.create(title: "Post-#{0 + 1}", text: 'We really suffered to get this working',comments_counter: 0, likes_counter: 0, id: 1, author_id: 1)
      @comment1 = Comment.create(author_id: 1, post_id: 1, text: "Test comment #{1}")
      @like1 = Like.create(author_id: 1, post_id: 1)

     visit '/users/1/posts'
    end

    it "should show user's profile" do
        expect(page.find('img')['src']).to have_content('https://www.google.com/image/1')
    end
    it "should show user's user name" do
        expect(page).to have_content('Tom')
    end
    it "should show the number of posts the user has written." do
        expect(page).to have_content(': 2')
    end
    it "should show the post's title" do
        expect(page).to have_content @post1.title
    end
    it "should show the post's body" do
        expect(page).to have_content @post1.text
    end
    
  end
end