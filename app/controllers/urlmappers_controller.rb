class UrlmappersController < ApplicationController
  def index
    @urlmapper = Urlmapper.new
    @urlmappers = Urlmapper.all
    @base = request.original_url
  end

  def create
    random = (0...50).map { ('a'..'z').to_a[rand(26)] }[0..4].join

    @urlmapper = Urlmapper.new(
      original_url: params[:urlmapper][:original_url],
      url_key: random
      )

    if @urlmapper.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def redirect
    link = Urlmapper.find_by(url_key: params[:url_key])
    link.count += 1
    link.save

    redirect_to "#{link.original_url}"

  end
end
