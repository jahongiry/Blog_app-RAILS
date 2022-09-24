class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  validates :title, presence: true, length: { in: 1..250 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_five_comments
    comments.last(5)
  end

  after_save :post_counter

  private

  def posts_counter
    user.increment!(:posts_counter)
  end
end
