class KeywordsController < ApplicationController
  skip_before_filter :authenticate_user!, only: :welcome

  def welcome
   render layout: "welcome"
  end

  # GET /keywords
  # GET /keywords.json
  def index
    @keywords = Keyword.where(user_id: current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @keywords }
    end
  end

  # GET /keywords/1
  # GET /keywords/1.json
  def show
    @keyword = Keyword.get(params[:id], current_user)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @keyword }
    end
  end

  # GET /keywords/new
  # GET /keywords/new.json
  def new
    @keyword = Keyword.new
    @keyword.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @keyword }
    end
  end

  # GET /keywords/1/edit
  def edit
    @keyword = Keyword.get(params[:id], current_user)
  end

  # POST /keywords
  # POST /keywords.json
  def create
    @keyword = Keyword.new(params[:keyword])
    @keyword.user = current_user

    respond_to do |format|
      if @keyword.save
        format.html { redirect_to @keyword, notice: 'Keyword was successfully created.' }
        format.json { render json: @keyword, status: :created, location: @keyword }
      else
        format.html { render action: "new" }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /keywords/1
  # PUT /keywords/1.json
  def update
    @keyword = Keyword.get(params[:id], current_user)
    @keyword.user = current_user

    respond_to do |format|
      if @keyword.update_attributes(params[:keyword])
        format.html { redirect_to @keyword, notice: 'Keyword was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keywords/1
  # DELETE /keywords/1.json
  def destroy
    @keyword = Keyword.get(params[:id], current_user)
    @keyword.destroy

    respond_to do |format|
      format.html { redirect_to keywords_url }
      format.json { head :no_content }
    end
  end
end
