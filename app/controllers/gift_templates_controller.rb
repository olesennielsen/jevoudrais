class GiftTemplatesController < ApplicationController
  # GET /gift_templates
  # GET /gift_templates.json
  def index
    @gift_templates = GiftTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gift_templates }
    end
  end

  # GET /gift_templates/1
  # GET /gift_templates/1.json
  def show
    @gift_template = GiftTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gift_template }
    end
  end

  # GET /gift_templates/new
  # GET /gift_templates/new.json
  def new
    @gift_template = GiftTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gift_template }
    end
  end

  # GET /gift_templates/1/edit
  def edit
    @gift_template = GiftTemplate.find(params[:id])
  end

  # POST /gift_templates
  # POST /gift_templates.json
  def create
    @gift_template = GiftTemplate.new(params[:gift_template])

    respond_to do |format|
      if @gift_template.save
        format.html { redirect_to gift_templates_path, notice: 'Gift template was successfully created.' }
        format.json { render json: @gift_template, status: :created, location: @gift_template }
      else
        format.html { render action: "new" }
        format.json { render json: @gift_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gift_templates/1
  # PUT /gift_templates/1.json
  def update
    @gift_template = GiftTemplate.find(params[:id])

    respond_to do |format|
      if @gift_template.update_attributes(params[:gift_template])
        format.html { redirect_to gift_templates_path, notice: 'Gift template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gift_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gift_templates/1
  # DELETE /gift_templates/1.json
  def destroy
    @gift_template = GiftTemplate.find(params[:id])
    @gift_template.destroy

    respond_to do |format|
      format.html { redirect_to gift_templates_path }
      format.json { head :no_content }
    end
  end
end
