class GoController < ApplicationController
  def index
    @link = Link.new
  end

  def redirect
    unique = params[:id]
    go_to = Link.find_by(random_string: unique)
    #binding.pry

    redirect_to go_to[:url]
  end

  def preview
    unique = params[:id]
    @link = Link.find_by(random_string: unique)
  end
end
