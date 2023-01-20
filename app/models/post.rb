class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  after_save :update_posts_counter

  def update_posts_counter
    User.increment_counter(:posts_counter, author_id)
  end

  def latest_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
