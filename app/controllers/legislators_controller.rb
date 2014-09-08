class LegislatorsController < ApplicationController
  layout 'application'

  def index
    @legislators = Legislator.all.sort_by(&:last_name)
  end

  def show
    @legislator = Legislator.find(params[:id])
    @bills = @legislator.bills.all.sort_by(&:introduced_on)
  end
end
