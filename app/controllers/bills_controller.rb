class BillsController < ApplicationController
  layout 'application'

  def index
    @bills = Bill.all.order("introduced_on desc").paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @bill = Bill.find(params[:id])
  end

end
