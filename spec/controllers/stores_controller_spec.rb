require 'spec_helper'

describe StoresController do
  describe 'GET #index' do
    it "populates an array of stores" do
      store = FactoryGirl.create(:store)
      get :index, @params = {:search => 'National City, CA', :distance => 20}
      assigns(:stores).should == [store]
    end

    it "renders the :index view" do
      get :index, @params = {:search => 'National City, CA', :distance => 20}
      response.should render_template :index
    end
  end

  describe 'GET #new' do
    it "assigns a new Store to @store" do
      get :new
      assigns(:store).should be_a_new(Store)
    end

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      @store = FactoryGirl.create(:store)
    end

    it "assigns the requested store to @store" do
      get :edit, :id => @store
      assigns(:store).should == @store
    end

    it "renders the :edit template" do
      get :edit, :id => @store
      response.should render_template :edit
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new store in the database" do
        expect {
          post :create, :store => FactoryGirl.attributes_for(:store)
        }.to change(Store, :count).by(1)
      end

      it "redirects to the stores page" do
        post :create, :store => FactoryGirl.attributes_for(:store)
        response.should redirect_to stores_url
      end
    end

    context "with invalid attributes" do
      it "does not save the new store in the database" do
        expect {
          post :create, :store => FactoryGirl.attributes_for(:store, :address => nil)
        }.to_not change(Store, :count)
      end

      it "re-renders the :new template" do
        post :create, :store => FactoryGirl.attributes_for(:store, :address => nil)
        response.should render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @store = FactoryGirl.create(:store, :name => 'Before Update Store Inc.')
    end

    context "with valid attributes" do
      it "updates the store in the database" do
        put :update, :id => @store, :store => FactoryGirl.attributes_for(:store, :name => 'After Update Store Ltd.')
        @store.reload
        @store.name.should == 'After Update Store Ltd.'
      end

      it "redirects to the stores page" do
        put :update, :id => @store, :store => FactoryGirl.attributes_for(:store)
        response.should redirect_to stores_url
      end
    end

    context "with invalid attributes" do
      it "does not update the store in the database" do
        put :update, :id => @store, :store => FactoryGirl.attributes_for(:store, :name => nil)
        @store.reload
        @store.name.should_not be_nil
      end

      it "re-renders the :edit template" do
        put :update, :id => @store, :store => FactoryGirl.attributes_for(:store, :name => nil)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @store = FactoryGirl.create(:store)
    end

    it "deletes the store from the database" do
      expect {
        delete :destroy, :id => @store
      }.to change(Store, :count).by(-1)
    end

    it "redirects to the stores page" do
      delete :destroy, :id => @store
      response.should redirect_to stores_url
    end
  end

end
