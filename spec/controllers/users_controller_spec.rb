require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe '#new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'sets an instance variable of User type' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe '#create' do
    context 'with valid parameters' do
      def valid_request
        post :create, params: { user: FactoryGirl.attributes_for(:user) }
      end

      it 'adds a user to the database' do
        count_before = User.count
        valid_request
        count_after = User.count
        expect(count_after).to eq(count_before + 1)
      end

      it 'redirects to the home page' do
        valid_request
        expect(response).to redirect_to(root_path)
      end

      it 'signs the user in' do
        valid_request
        expect(session[:user_id].present?).to be(true)
      end

    end
    context 'with invalid parameters' do
      def invalid_request
        post :create, params: { user: FactoryGirl.attributes_for(:user, first_name: nil) }
      end

      it 'renders the New template' do
        invalid_request
        expect(response).to render_template(:new)
      end

      it 'doesn\'t add a user to the database' do
        count_before = User.count
        invalid_request
        count_after = User.count
        expect(count_after).to eq(count_before)
      end
    end
  end

end
