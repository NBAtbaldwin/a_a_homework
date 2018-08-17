# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject(:tyler) { User.new(email: 't@bald.com', session_token: 'sadfdsafdf', password_digest: 'asdfsafsasss')}

  describe 'validations' do
    it "should validate the presence of email" do
      user = User.new(session_token: '44fsfaf', password_digest: 'sadffddaa', id: 2)
      expect(user.valid?).to be false
    end

    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) }

  end

  describe "class methods" do
    describe "::find_by_credentials" do
      it "finds a user with the specified email and password if user exists" do
        user = User.create(email: 'thing@thing.com', password: 'password')
        expect(User.find_by_credentials('thing@thing.com', 'password').id).to eq(user.id)
      end
      it "does not return a user who does not match the search criteria" do
        user = User.create(email: 'thing@thing.com', password: 'password')
        expect(User.find_by_credentials('thing@thing.com', 'passwordd')).to be nil
      end
    end

    describe "#is_password?" do
      it "matches correct password with a stored password digest" do
        user = User.create(email: 'thing@thing.com', password: 'tangoAlpha')
        expect(user.is_password?('tangoAlpha')).to be(true)
      end

      it "returns false for a non-matching password" do
        user = User.create(email: 'thing@thing.com', password: 'tangoAlpha')
        expect(user.is_password?('bravoAlpha')).to be(false)
      end
    end

    describe "#reset_session_token!" do
      it "resets a user's session token when called" do
        user = User.create(email: 'thing@thing.com', password: 'tangoAlpha')
        token1 = user.session_token
        token2 = user.reset_session_token!
        expect(token1).not_to eq(token2)
      end
    end
  end
end
