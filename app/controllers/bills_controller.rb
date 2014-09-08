class BillsController < ApplicationController
  layout 'application'

  def index
    @bills = Bill.all.sort_by(&:introduced_on)
  end

  def show
    @bill = Bill.find(params[:id])
  end

end
