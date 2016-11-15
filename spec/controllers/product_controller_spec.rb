require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe '#index' do

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns a list of the database content' do
      product_1 = FactoryGirl.create(:product)
      product_2 =  FactoryGirl.create(:product)
      get :index

      expect(assigns(:products)).to match_array([product_2, product_1])
    end

  end

  describe '#destroy' do

    it 'removes the deleted object from the database' do
      product = FactoryGirl.create(:product)
      delete :destroy, params: { id: product.id }
      expect{product.reload}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'redirects to index' do
      product = FactoryGirl.create(:product)
      delete :destroy, params: { id: product.id }
      expect(response).to redirect_to(products_path)
    end

  end

  describe '#show' do

    it 'renders the show template' do
      product = FactoryGirl.create(:product)
      get :show, params: { id: product.id }
      expect(response).to render_template(:show)
    end


    it 'sets an instance variable with the correct product' do
      product = FactoryGirl.create(:product)
      get :show, params: { id: product.id }
      expect(assigns(:product)).to eq(product)
    end

  end





























  # describe '#new' do
  #     it 'renders the new template' do
  #       # this mimicks making a GET request to the CampaignsController
  #       get :new
  #       expect(response).to render_template(:new)
  #     end
  #
  #     it 'instantiates a new campaign object' do
  #       get :new
  #       # assigns(:campaign) will test for an instance varialbe: @campaign
  #       # be_a_new(Campaign) will match that the instance variable is of class
  #       #                    Campaign and it's a non-persisted object
  #       expect(assigns(:campaign)).to be_a_new(Campaign)
  #     end
  #   end
  #
  #   describe '#create' do
  #     context 'with valid params' do
  #       def valid_request
  #         post :create, params: { campaign: attributes_for(:campaign) }
  #       end
  #       it 'saves a record to the database' do
  #         count_before = Campaign.count
  #         valid_request
  #         count_after = Campaign.count
  #         expect(count_after).to eq(count_before + 1)
  #       end
  #       it 'redirects to the campaign show page' do
  #         valid_request
  #         expect(response).to redirect_to(campaign_path(Campaign.last))
  #       end
  #     end
  #     context 'with invalid params' do
  #       def invalid_request
  #         post :create, params: {
  #                         campaign: attributes_for(:campaign, title: nil)
  #                       }
  #       end
  #       it 'doesn\'t save a record to the database' do
  #         count_before = Campaign.count
  #         invalid_request
  #         count_after = Campaign.count
  #         expect(count_after).to eq(count_before)
  #       end
  #       it 'renders the new template' do
  #         invalid_request
  #         expect(response).to render_template(:new)
  #       end
  #     end
  #   end
    #
    # describe '#show' do
    #   it 'renders the show template' do
    #     campaign = create(:campaign)
    #     get :show, params: { id: campaign.id }
    #     expect(response).to render_template(:show)
    #   end
    #   it 'sets an instance variable with the campaign whose id is passed' do
    #     campaign = create(:campaign)
    #     get :show, params: { id: campaign.id }
    #     expect(assigns(:campaign)).to eq(campaign)
    #   end
    # end

end
