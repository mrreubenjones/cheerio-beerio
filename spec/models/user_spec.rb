require 'rails_helper'

RSpec.describe User, type: :model do\

  describe 'validations' do
    it 'requires a first name' do
      tommy = User.new
      tommy.valid?
      expect(tommy.errors).to have_key(:first_name)
    end

    it 'requires a last name' do
      tommy = User.new
      tommy.valid?
      expect(tommy.errors).to have_key(:last_name)
    end

    it 'requires a unique email' do
      reuben = FactoryGirl.create :user, email: 'reuben@awesome.com'
      tommy = FactoryGirl.build :user, email: 'reuben@awesome.com'
      tommy.valid?
      expect(tommy.errors).to have_key(:email)
    end

    it 'requires a valid full name' do
      hacker = FactoryGirl.create :user, first_name: 'reuben', last_name: 'jones'

      expect(hacker.full_name).to eq("Reuben Jones")
    end



  end

  end



