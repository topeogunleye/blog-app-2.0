require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before :each do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Poland.')
    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
    Comment.create(post: first_post, author: second_user, text: 'Hello Tom!')
    visit user_path(first_user)
  end

  describe 'show page' do
    it "I can see the user's profile picture" do
      all_images = page.all('img')
      all_images.each do |img|
        link = img[:src]
        expect(link).to eq('/assets/img2-3b2280af3d478258894911b061e6c8002e3a687c7ad0568da200cb39dc5e35f4.jpg')
      end
    end

    it "I can see the user's username" do
      expect(page).to have_content('Tom')
    end

    it 'I can see the number of posts the user has written' do
      expect(page).to have_content('Number of Posts: 1')
    end

    it "I can see the user's bio." do
      expect(page).to have_content('Teacher from Mexico.')
    end

    it "I can see a post's title." do
      expect(page).to have_content('Hello')
    end

    it "I can see the user's first 3 posts" do
      # Add code to create and display first 3 posts
      expect(page).to have_content('Hello')
    end

    it "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_link('See More')
    end

    it "redirects me to that post's show page when I click on users post." do
      click_on 'Hello'
      expect(page).to have_content('Hello')
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      click_link 'See More'
      expect(page).to have_content('Number of posts: 1')
    end
  end
end
