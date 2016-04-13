require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#add_avatar' do
  	clear_users
    let(:user){ User.new(email: 'yo@ho.com', password: 'password')}
    it 'takes a file location as an argument' do
      user.add_avatar('goats_avatar.jpg')
      expect(user.avatar_url).to eq("/uploads/user/avatar/#{user.id}/goats_avatar.jpg")
    end
  end

end
