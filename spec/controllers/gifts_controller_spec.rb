require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe GiftsController do

  # This should return the minimal set of attributes required to create a valid
  # Gift. As you add validations to Gift, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GiftsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all gifts as @gifts" do
      gift = Gift.create! valid_attributes
      get :index, {}, valid_session
      assigns(:gifts).should eq([gift])
    end
  end

  describe "GET show" do
    it "assigns the requested gift as @gift" do
      gift = Gift.create! valid_attributes
      get :show, {:id => gift.to_param}, valid_session
      assigns(:gift).should eq(gift)
    end
  end

  describe "GET new" do
    it "assigns a new gift as @gift" do
      get :new, {}, valid_session
      assigns(:gift).should be_a_new(Gift)
    end
  end

  describe "GET edit" do
    it "assigns the requested gift as @gift" do
      gift = Gift.create! valid_attributes
      get :edit, {:id => gift.to_param}, valid_session
      assigns(:gift).should eq(gift)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Gift" do
        expect {
          post :create, {:gift => valid_attributes}, valid_session
        }.to change(Gift, :count).by(1)
      end

      it "assigns a newly created gift as @gift" do
        post :create, {:gift => valid_attributes}, valid_session
        assigns(:gift).should be_a(Gift)
        assigns(:gift).should be_persisted
      end

      it "redirects to the created gift" do
        post :create, {:gift => valid_attributes}, valid_session
        response.should redirect_to(Gift.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved gift as @gift" do
        # Trigger the behavior that occurs when invalid params are submitted
        Gift.any_instance.stub(:save).and_return(false)
        post :create, {:gift => { "name" => "invalid value" }}, valid_session
        assigns(:gift).should be_a_new(Gift)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Gift.any_instance.stub(:save).and_return(false)
        post :create, {:gift => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested gift" do
        gift = Gift.create! valid_attributes
        # Assuming there are no other gifts in the database, this
        # specifies that the Gift created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Gift.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => gift.to_param, :gift => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested gift as @gift" do
        gift = Gift.create! valid_attributes
        put :update, {:id => gift.to_param, :gift => valid_attributes}, valid_session
        assigns(:gift).should eq(gift)
      end

      it "redirects to the gift" do
        gift = Gift.create! valid_attributes
        put :update, {:id => gift.to_param, :gift => valid_attributes}, valid_session
        response.should redirect_to(gift)
      end
    end

    describe "with invalid params" do
      it "assigns the gift as @gift" do
        gift = Gift.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Gift.any_instance.stub(:save).and_return(false)
        put :update, {:id => gift.to_param, :gift => { "name" => "invalid value" }}, valid_session
        assigns(:gift).should eq(gift)
      end

      it "re-renders the 'edit' template" do
        gift = Gift.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Gift.any_instance.stub(:save).and_return(false)
        put :update, {:id => gift.to_param, :gift => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested gift" do
      gift = Gift.create! valid_attributes
      expect {
        delete :destroy, {:id => gift.to_param}, valid_session
      }.to change(Gift, :count).by(-1)
    end

    it "redirects to the gifts list" do
      gift = Gift.create! valid_attributes
      delete :destroy, {:id => gift.to_param}, valid_session
      response.should redirect_to(gifts_url)
    end
  end

end
