require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'hello man') }

  before { subject.save }

  it 'Users should be not be Valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'Posts Counter attribute should be an integer number' do
    subject.posts_counter = 'some random string'
    expect(subject).to_not be_valid
  end

  it 'Posts Counter attribute should be greater or equal to zero' do
    subject.posts_counter = -4
    expect(subject).to_not be_valid
  end
  it 'last_three_posts method should return the last three posts' do
    user = described_class.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                  bio: 'Teacher from Mexico.')

    user.posts = [
      Post.new({ title: 'Post One', text: 'This is the post one' }),
      Post.new({ title: 'Post Two', text: 'This is the post two' }),
      Post.new({ title: 'Post Three', text: 'This is the post three' }),
      Post.new({ title: 'Post Four', text: 'This is the post four' })
    ]

    expect(user.last_three_post.size).to be(3)
    expect(user.last_three_post.pluck(:id)).to match_array(user.posts.last(3).pluck(:id))
  end
end
