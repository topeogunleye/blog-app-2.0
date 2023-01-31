require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before :each do
    # Create and log in the current user
    current_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.')
    # Add some posts to the current user
    Post.create(author: current_user, title: 'Hello', text: 'This is my first post')
    Post.create(author: current_user, title: 'Hallo from the other side', text: 'This is my second post')
    # Visit the current user's post index page
    visit user_posts_path(current_user.id)
  end

  describe 'index page' do
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
      expect(page).to have_content('Number of posts: 2')
    end

    it "I can see a post's title" do
      expect(page).to have_content('Hello')
    end

    it "I can see some of the post's body." do
      expect(page).to have_content('My first post')
    end

    it 'I can see the first comments on a post' do
      # Add code to create and display first 3 posts
      expect(page).to have_content('Hello')
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content('Comments: 0')
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content('Likes: 0')
    end

    it 'paginates posts' do
      expect(page).to have_content('Previous')
      expect(page).to have_content('Next')
    end

    it "When I click on a post, it redirects me to that post's show page." do
      click_on 'Hello'
      expect(page).to have_content('Hello')
    end
  end
end
