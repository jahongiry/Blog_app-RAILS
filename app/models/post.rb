class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, length: { maximum: 500 }
  # validates :comments_conter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_user_posts_count

  def update_user_posts_count
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    comments.last(5)
  end
end
