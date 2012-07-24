class PeopleController < ApplicationController
  before_filter :signed_in_user
  respond_to :html, :json
    
  # GET /people
  # GET /people.json
  def index
    (params[:tags]) ? @people = Person.page(params[:page]).by_tags(current_user, params[:tags]) : @people = Person.page(params[:page]).by_user(current_user)
    respond_to do |format|
      format.html
      format.js { @people }
    end
    #respond_to do |format|
     # format.html # index.html.erb
     # format.json { render json: @people }
    #end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])
    (params[:tags]) ? @activities = @person.activities.with_tags(params[:tags]).page(params[:page]) : @activities = @person.activities.page(params[:page])
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end



  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])
    @person.userid = current_user.id

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])
    @person.userid = current_user.id

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to(@person, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@person) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@person) }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    @people = Person.by_user(current_user)
  end
end
