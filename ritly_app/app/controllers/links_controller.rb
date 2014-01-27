class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    random_string = SecureRandom.urlsafe_base64(10)
    get_link = params.require(:link).permit(:url)
    full_link = complete_url(get_link[:url])

    @link = Link.create(url: full_link, random_string: random_string)

    redirect_to link_path(@link.id)
  end

  def show

    id = params[:id]
    @link = Link.find(id)
    # unique = params[:random_string]

    # @link = Link.find_by(random_string: unique)
  end

  private

    #these should be moved to the model
    def unique_code?(random_string)
    end

    def complete_url(url)
      if url.match("http://www.").nil?
        url = "http://www." + url
      elsif url.match("http://").nil?
        url = "http://" + url
      end
    end

    #/model methods

end
