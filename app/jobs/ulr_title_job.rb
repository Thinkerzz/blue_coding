require 'nokogiri'
require 'open-uri'

class UlrTitleJob < ApplicationJob
  def perform(*args)
    debugger
    # url = URI.open()
    # response = Nokogiri::HTML(url)
  end
end
