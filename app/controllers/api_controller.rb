class ApiController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def events
    head :ok
  end
end
