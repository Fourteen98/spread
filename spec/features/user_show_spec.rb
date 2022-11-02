require 'rails_helper'

RSpec.feature 'UserShows', type: :feature do
  describe 'Show', bullet: :skip do
    before(:example) do
      @usr1 = User.create(id: 1, name: 'Abraha', photo: 'https://www.google.com/image/1', bio: 'From Ethiopia', posts_counter: 9)
      5.times do |post|
        Post.create(title: "Post-#{post + 1}",
                    text: 'Capybara it is, did not know it was an animal',
                    comments_counter: 0, likes_counter: 0, id: post + 1, author_id: 1)
      end
      visit '/users/1'
    end
    it 'Is displaying the user profile picture.' do
      expect(page.find('img')['src']).to have_content('https://www.google.com/image/1')
    end

    it 'Is displaying the user name.' do
       expect(page).to have_content('Abraha')
    end

     it 'Is displaying the number of posts the user has written.' do
        expect(page).to have_content('Number of posts: 9')
     end

    it 'It is displaying the users bio.' do
      expect(page).to have_content('From Ethiopia')
    end

    it "it is displaying the users first 3 posts" do
      expect(page).to have_content('Post-1')
      expect(page).to have_content('Post-2')
      expect(page).to have_content('Post-3')
    end

    it 'I can see the button that lets me view all of a users posts.' do
      expect(page).to have_content('See All Posts')
    end

    it 'When I click a users post, it redirects me to that post show page.' do
      click_link('Post-1')
      expect(page).to have_content('Post-1')
    end

    it 'When I click the to see all post, it redirects me to the users post index page.' do
      click_link('See All Posts')
      expect(page).to have_content('Post-1')
      expect(page).to have_content('Post-2')
      expect(page).to have_content('Post-3')
      expect(page).to have_content('Post-4')
      expect(page).to have_content('Post-5')
    end
  end
end