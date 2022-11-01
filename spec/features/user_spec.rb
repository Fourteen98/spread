require 'rails_helper'

RSpec.describe 'User test', type: :feature do
  describe 'index' do
    before(:example) do
      @user1 = User.create(id: 1, name: 'Tom', photo: 'https://www.google.com/image/1', bio: 'He is Abrahas friend', post_counter: 2)
      @user2  = User.create(id: 2, name: 'Youssef', photo: 'https://www.google.com/image/4', bio: 'He is Abrahas best friend', post_counter: 4)
      visit '/'
    end
    it "I can see the username of all other users" do
      expect(page).to have_content @user1.name
      expect(page).to have_content @user2.name
    end
    it "I can see the profile picture for each user" do
      expect(page).to have_selector('img', count: 2)
    end
    it "I can see the number of posts each user has written" do
      expect(page).to have_content('2')
      expect(page).to have_content('4')
    end
    it "When I click on a user, I am redirected to that user's show page" do
      click_link 'Tom'
      expect(page.current_path).to eql('/users/1')
    end
  end
end
