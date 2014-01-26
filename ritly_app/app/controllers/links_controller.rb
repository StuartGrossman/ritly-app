class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    random_string = SecureRandom.urlsafe_base64(10)
    new_link = params.require(:link).permit(:url)
    Link.create(url: new_link[:url], random_string: random_string)

    redirect_to links_path
  end

  def show
    unique = params[:random_string]

    Link.find_by(random_string: unique)
  end

  private

    #these should be moved to the model
    def unique_code?(random_string)
    end

    def unique_url?(url)
    end

    #/model methods

end
