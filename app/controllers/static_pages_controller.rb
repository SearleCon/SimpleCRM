class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @people = Person.by_user(current_user)
      @today_activities = Activity.due_today(current_user)
      @future_activities = Activity.due_in_five_days(current_user)

    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end

  def filter
    (params[:tags]) ? @people = Person.by_tags(current_user, params[:tags]) : @people = Person.by_user(current_user)
    respond_to do |format|
      format.html { redirect_to root_path}
      format.js { @people }
    end
  end
end
