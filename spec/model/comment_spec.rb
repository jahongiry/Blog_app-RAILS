require 'rails_helper'
RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'hello man') }
  before { subject.save }
  it 'comments should be not be Valid' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end