class BandsController < ApplicationController
  before_action :require_login

  def index
    @bands = Band.all.includes(:albums)
  end
end
