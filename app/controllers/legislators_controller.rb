class LegislatorsController < ApplicationController
  layout 'application'

  def index
    @legislators = Legislator.all.order("last_name, first_name")
  end

  def show
    @legislator = Legislator.find(params[:id])
    @bills = @legislator.bills.all.order("introduced_on desc")
  end
end
