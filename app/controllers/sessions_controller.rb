class SessionsController < ApplicationController
  def destroy 
    session.destroy 
  end
end