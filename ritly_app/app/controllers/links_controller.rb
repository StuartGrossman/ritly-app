class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    link = params.require(:link).permit(:url, :random_string)
    custom_string = params[:link][:random_string]
    full_link_url = complete_url(link[:url])

    if custom_string == ""
      random_string = SecureRandom.urlsafe_base64(10)
      @link = Link.create(url: full_link_url, random_string: random_string)
    elsif unique_code?(custom_string)
      @link = Link.create(url: full_link_url, random_string: custom_string)
    else
      render :partial => "sorry"
    end

    redirect_to link_path(@link.id) if @link != nil
  end

  def show

    id = params[:id]
    @link = Link.find(id)
    # unique = params[:random_string]

    # @link = Link.find_by(random_string: unique)
  end

  private

    #these should be moved to the model
    def unique_code?(string)
      Link.find_by(random_string: string).nil?
    end

    def complete_url(url)
      www = "www."
      http = "http://"

      if url.match(www).nil?
        url = www + url
      end

      if url.match(http).nil?
        url = http + url
      end
    end

    #/model methods

end
