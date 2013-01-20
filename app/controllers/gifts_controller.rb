class GiftsController < ApplicationController
  # GET /gifts
  # GET /gifts.json
  def index
    @gifts = Gift.where(:user_id => params[:user])
    @user = User.find(params[:user])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gifts }
    end
  end

  # GET /gifts/1
  # GET /gifts/1.json
  def show
    @gift = Gift.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gift }
    end
  end

  # GET /gifts/new
  # GET /gifts/new.json
  def new
    @gift = Gift.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gift }
    end
  end

  # GET /gifts/1/edit
  def edit
    @gift = Gift.find(params[:id])
  end

  # POST /gifts
  # POST /gifts.json
  def create
    @gift = Gift.create!(params[:gift])

    respond_to do |format|
      if @gift.save
        format.html { redirect_to @gift, notice: 'Gift was successfully created.' }
        format.json { render json: @gift, status: :created, location: @gift }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gifts/1
  # PUT /gifts/1.json
  def update
    @gift = Gift.find(params[:id])

    respond_to do |format|
      if @gift.update_attributes(params[:gift])
        format.html { redirect_to @gift, notice: 'Gift was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.json
  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy

    respond_to do |format|
      format.html { redirect_to gifts_url }
      format.json { head :no_content }
    end
  end
  
  def give
    @gift = Gift.find(params[:id])
    @gift.update_attributes(:giver_id => current_user.id)
    @giver = User.get_giver(@gift.giver_id)

    respond_to do |format|
      format.js
    end
  end
  
  def get_giver
    @users = User.find(params[:id])
    
    @name = { :name => @users.name }
    
    respond_to do |format|
      format.json { render json: @name }
    end
  end
end
