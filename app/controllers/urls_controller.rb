class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :visit_original]
  before_action :validate_url, only: [:show, :visit_original]

  def index
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.title = UlrTitleJob.perform_later(@url.original_url)
    @url.short_url = @url.make_url_short

    if @url.save
      redirect_to @url
    else
      redirect_to urls_path
    end
  end

  def show
  end

  def visit_original
    @url.update(visit_count: (@url.visit_count + 1))
    redirect_to @url.original_url
  end

  def leader_board
    @urls = Url.order(visit_count: :desc).limit(100)
  end

  private

  def set_url
    @url = Url.find(params[:id])
  end

  def validate_url
    redirect_to urls_path if @url.blank?
  end

  def url_params
    params.require(:url).permit(:original_url, :short_url)
  end
end
