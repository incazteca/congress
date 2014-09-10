class LegislatorsController < ApplicationController
  layout 'application'

  def index
    @legislators = Legislator.all.order("last_name, first_name").paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @legislator = Legislator.find(params[:id])
    @bills = @legislator.bills.all.order("introduced_on desc")
  end
end
