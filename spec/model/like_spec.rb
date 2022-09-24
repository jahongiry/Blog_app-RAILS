require 'rails_helper'
RSpec.describe Like, type: :model do
  subject { Like.new }
  it 'Likes should be not be Valid' do
    expect(subject).to_not be_valid
  end
  it 'Post like counter to increment' do
    subject.post = Post.new(title: 'Post One', text: 'This is the post one')
    subject.send(:likes_counter)
    expect(subject.post.likes_counter).to be(1)
  end
end
