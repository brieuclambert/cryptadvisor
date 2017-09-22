class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @values = Value.last(2000)
  end
end
