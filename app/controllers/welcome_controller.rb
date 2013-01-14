class WelcomeController < ApplicationController
  def index
  	@directory = Directory.first
  end
end
