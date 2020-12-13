class AboutController < ApplicationController
  def index
    render 'index', formats: [:html]
  end
end
