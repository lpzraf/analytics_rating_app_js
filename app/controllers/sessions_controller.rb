class SessionsController < ApplicationController
  # def login
  # end
  #
  # def signup
  # end
  #
  # def welcome
  # end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    if @session.save
      redirect_to account_url
    else
      render :action => :new
    end
  end

  def destroy
    current_session.destroy
    redirect_to root_path
  end

end
