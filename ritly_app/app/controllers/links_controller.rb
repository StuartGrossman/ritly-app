class LinksController < ApplicationController
  def index
  end

  def new
  end

  def create
    unique = params[:random_string]

    Link.find_by(random_string: unique)
  end

  def show
  end

  private

    #these should be moved to the model
    def unique_code?(random_string)
    end

    def unique_url?(url)
    end

    #/model methods

end
