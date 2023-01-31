require 'rails_helper'


RSpec.describe "User", type: :feature do
  before :each do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
    Comment.create(post: first_post, author: second_user, text: 'Hello Tom!' )
    visit users_path
  end

  describe "index page" do
    it "I can see the user's profile picture" do
      all_images = page.all('img')
      all_images.each do |img|
        link = img[:src]
        expect(link).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
      end
    end
  
    it "I can see the user's username" do
      visit users_path
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end
  
    it "I can see the number of posts the user has written" do
      visit users_path
      expect(page).to have_content('Number of Posts: 1')
    end
  
    it "I can see the user's bio" do
      visit users_path
      expect(page).to have_content('Teacher from Mexico.')
      expect(page).to have_content('Teacher from Poland.')
    end
  
    it "I can see the user's first 3 posts" do
      # Add code to create and display first 3 posts
    end

  end
end
