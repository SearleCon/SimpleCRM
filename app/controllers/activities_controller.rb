class ActivitiesController < ApplicationController
  before_filter :signed_in_user, :get_person
  #after_filter :get_activities_paginated


  # GET /Activities
  # GET /activities.json
  def index
      if @person
       @activities = @person.activities.all
      else
       @activities = Activity.where(:userid => current_user.id, :person_id => nil)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])
    @tags = @activity.tags.all.page(params[:page]).per(6)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @tags = Tag.all
    @activity = Activity.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @tags = Tag.all
    @activity = Activity.find(params[:id])
  end

  def filtered_by_tags
    @person = Person.find(@person.id,:include => { :activities => :tags }, :conditions => { :tags => {:id => params[:tags] } } ) if params[:tags]
    @activities = @person.activities.page(params[:page]).per(6)


    respond_to do |format|
      format.html { redirect_to person_path}
      format.js { @person }
    end
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(params[:activity])
    @activity = @person.activities.new(params[:activity])
    @activity.userid= current_user.id

    respond_to do |format|
      if @activity.save
        flash[:success] = "activity created!"
        @activities = @person.activities.page(params[:page]).per(6)
         format.html { redirect_to person_path(@person) }
         format.js { @person }
         format.json { render json: @activity.as_json(:include => :tags), status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    params[:activity][:tag_ids] ||= []
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    @activities = @person.activities.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html { redirect_to person_path(@person) }
      format.js { @person }
    end
  end

  def get_person
    @person = Person.find(params[:person_id]) if params[:person_id]
  end

  def get_activities_paginated
    @activities = @person.activities.paginate(:page => params[:page], :per_page => 10)
  end

end
