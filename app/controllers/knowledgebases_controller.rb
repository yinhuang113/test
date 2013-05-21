class KnowledgebasesController < ApplicationController
  # GET /knowledgebases
  # GET /knowledgebases.json
  def index
    @knowledgebases = Knowledgebase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @knowledgebases }
    end
  end

  # GET /knowledgebases/1
  # GET /knowledgebases/1.json
  def show
    @knowledgebasis = Knowledgebase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @knowledgebasis }
    end
  end

  # GET /knowledgebases/new
  # GET /knowledgebases/new.json
  def new
    @knowledgebasis = Knowledgebase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @knowledgebasis }
    end
  end

  # GET /knowledgebases/1/edit
  def edit
    @knowledgebasis = Knowledgebase.find(params[:id])
  end

  # POST /knowledgebases
  # POST /knowledgebases.json
  def create
    @knowledgebasis = Knowledgebase.new(params[:knowledgebasis])

    respond_to do |format|
      if @knowledgebasis.save
        format.html { redirect_to @knowledgebasis, notice: 'Knowledgebase was successfully created.' }
        format.json { render json: @knowledgebasis, status: :created, location: @knowledgebasis }
      else
        format.html { render action: "new" }
        format.json { render json: @knowledgebasis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /knowledgebases/1
  # PUT /knowledgebases/1.json
  def update
    @knowledgebasis = Knowledgebase.find(params[:id])

    respond_to do |format|
      if @knowledgebasis.update_attributes(params[:knowledgebasis])
        format.html { redirect_to @knowledgebasis, notice: 'Knowledgebase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @knowledgebasis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledgebases/1
  # DELETE /knowledgebases/1.json
  def destroy
    @knowledgebasis = Knowledgebase.find(params[:id])
    @knowledgebasis.destroy

    respond_to do |format|
      format.html { redirect_to knowledgebases_url }
      format.json { head :no_content }
    end
  end
end
