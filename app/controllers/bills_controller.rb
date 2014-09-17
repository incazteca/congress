require 'will_paginate'

class BillsController < ApplicationController
  layout 'application'

  def index
    @bills = Bill.order("introduced_on desc").
      paginate(page: params[:page], per_page: 10)
  end

  def show
    @bill = Bill.find(params[:id])
    @tags = Tag.find_by_user_id(current_user.id)
  end

end
