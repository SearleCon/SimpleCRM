class TagsController < ApplicationController
  before_filter :signed_in_user
  respond_to :html, :json
  
  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tags }
    end
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /tags/new
  # GET /tags/new.json
  def new
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(params[:tag])
    @tag.userid = current_user.id

    respond_to do |format|
      if @tag.save
        format.html { redirect_to tags_path }
      else
        format.html { render action: "new" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.json
  def update
    @tag = Tag.find(params[:id])

   respond_to do |format|
    if @tag.update_attributes(params[:tag])
      format.html { redirect_to tags_path  }
      format.json { respond_with_bip(@tag) }
    else
      format.html { redirect_to tags_path }
      format.json { respond_with_bip(@tag) }
    end
   end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    @tags = Tag.all
  end
end
