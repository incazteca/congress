class LegislatorsController < ApplicationController
  layout 'application'

  def index
    @legislator = Legislator.first if params[:legislator_id].nil?
  end

  def show
    @legislators = Legislator.all.sort_by(&:last_name)
  end

  def profile
    @legislator = Legislator.find_by(bioguide_id: params[:bioguide_id]) unless params[:bioguide_id].nil?
    @bills = @legislator.bills.all.sort_by(&:introduced_on)
  end
end
