require 'rails_helper'
RSpec.describe 'users#index', type: :feature do
  describe 'user index page' do
    before(:each) do
      # rubocop: disable Layout/LineLength
      @user1 = User.create(name: 'Yusupov', photo: "//img[contains(@src,'https://www.thoughtco.com/thmb/0I-Uw-0rcc6MUzcZJauNGKR9JzA=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/male-computer-programmer-using-laptop-at-desk-in-office-755650739-5c5bb32346e0fb0001f24d3d.jpg')]", bio: 'bio', posts_counter: 0)
      @user2 = User.create(name: 'Amy', bio: 'bio', photo: 'https://image.benq.com/is/image/benqco/monitor-for-programmer-1?$ResponsivePreset$&wid=1468')
      @user3 = User.create(name: 'Jerry', bio: 'bio', photo: 'https://www.mooc.org/hs-fs/hubfs/learn-programming-career-jpg.jpeg?width=500&name=learn-programming-career-jpg.jpeg')
      # rubocop: enable Layout/LineLength
      visit root_path
    end

    it 'shows the profile picture for each user' do
      expect(page).to have_xpath("//img[contains(@src,'https://www.thoughtco.com/thmb/0I-Uw-0rcc6MUzcZJauNGKR9JzA=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/male-computer-programmer-using-laptop-at-desk-in-office-755650739-5c5bb32346e0fb0001f24d3d.jpg')]")
      expect(page).to have_xpath("//img[contains(@src,'https://image.benq.com/is/image/benqco/monitor-for-programmer-1?$ResponsivePreset$&wid=1468')]")
      expect(page).to have_xpath("//img[contains(@src,'https://www.mooc.org/hs-fs/hubfs/learn-programming-career-jpg.jpeg?width=500&name=learn-programming-career-jpg.jpeg')]")
    end

    it 'When I click on a user, I am redirected to that user\'s show page' do
      click_link 'Amy'
      expect(page).to have_current_path user_path(@user2)
    end

    it 'shows the number of posts each user has written' do
      expect(page).to have_content('Posts: 0')
    end
  end
end
