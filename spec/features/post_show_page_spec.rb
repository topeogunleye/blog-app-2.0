require 'rails_helper'


RSpec.describe "User", type: :feature do
  before :each do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
    Comment.create(post: first_post, author: second_user, text: 'Hello Tom!' )
    visit user_posts_path(first_user, first_post)
  end

  describe "index page" do
    it "I can see the post's title" do
      expect(page).to have_content('Hello')
    end
  
    it "I can see who wrote the post." do
      expect(page).to have_content('Tom')
    end
  
    it "I can see how many comments it has." do
      expect(page).to have_content('Comments: 2')
    end
  
    it "I can see how many likes it has." do
      expect(page).to have_content('Likes: 0')
    end
  
    it "I can see the post body." do
      expect(page).to have_content('My first post') 
    end

    it "I can see the username of each commentor." do
      expect(page).to have_content('Lilly')
    end

    it "I can see the body of each comment." do
      expect(page).to have_content('Hi Tom!')
      expect(page).to have_content('Hello Tom!')
    end
  end
end
