class WelcomeController < ApplicationController
  skip_before_action :login_in?
  
  def home
  end

end