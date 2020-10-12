class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def my_portfolio
  end
end
