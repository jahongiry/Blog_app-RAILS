require 'rails_helper'
RSpec.describe 'users#index', type: :feature do
  describe 'user index page' do
    before(:each) do

      visit root_path
    end

    it "Shows the user's photo" do
      all('img').each do |i|
        expect(i[:src]).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
      end
    end

    it 'shows the number of posts each user has written' do
      expect(page).to have_content("1")
    end
  end
end