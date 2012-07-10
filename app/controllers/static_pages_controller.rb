class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @people = Person.by_user(current_user)

    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
