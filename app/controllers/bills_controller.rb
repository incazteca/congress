class BillsController < ApplicationController
  layout 'application'

  def index
    @bills = Bill.all.order("introduced_on desc")
  end

  def show
    @bill = Bill.find(params[:id])
  end

end
