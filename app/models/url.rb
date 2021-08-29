class Url < ApplicationRecord

  def make_url_short
    rand(36**8).to_s(36)
  end
end
