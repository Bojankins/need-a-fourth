class TeetimesController < ApplicationController
  before_action :authenticate_user!
  def new
    @teetime = Teetime.new
  end

end
