class BillsController < ApplicationController
  layout 'application'

  def index
    @bill = Bill.find_by(bill_id: params[:bill_id]) unless params[:bill_id].nil?
    @bill = Bill.first if params[:bill_id].nil?
  end

  def show
    @bills = Bill.all.sort_by(&:introduced_on)
  end

end