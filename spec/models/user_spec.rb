require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Tests for User model validation ' do
    subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should not be blank' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'posts counter should be greater than or equal than 0' do
      subject.posts_counter = -5
      expect(subject).to_not be_valid
    end

    it 'posts counter should be an integer' do
      subject.posts_counter = 5.8
      expect(subject).to_not be_valid
    end
  end

  describe 'Tests for User model methods' do
    before { 10.times { Post.create(author: subject, title: 'Hello', text: 'This is my first post') } }

    it 'recent three posts should return 3 posts' do
      expect(subject.recent_three_posts).to eql(subject.posts.last(3))
    end
  end
end
