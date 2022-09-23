class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  def last_five_comments
    comments.last(5)
  end

  def posts_counter
    user.increment!(:posts_counter)
  end
end
