require 'will_paginate'

class LegislatorsController < ApplicationController
  layout 'application'

  def index
    @legislators = Legislator.order("last_name, first_name").paginate(page: params[:page], per_page: 10)
  end

  def show
    @legislator = Legislator.find(params[:id])
    @bills = @legislator.bills.order("introduced_on desc").paginate(page: params[:page], per_page: 10)
  end
end
