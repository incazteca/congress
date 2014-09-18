class TagsController < ApplicationController
  before_action :authenticate_user!

  def create
    # After lunch under if bioguide get leg id and set tag type
    tag_type = "legislator" if bioguide_id?(params[:item_id])
    tag_type = "bill" if tag_type.nil?

    tag_legislator if bioguide_id?(params[:item_id])
    tag_bill if bill_id?(params[:item_id])

    render json: '{"status":"success"}'
  end

  def destroy
    Tag.find(params[:id]).destroy

    render json: '{"status":"success"}'
  end

  private

  def bioguide_id?(term)
    /[a-z]\d{6}/ =~ term
  end

  def bill_id?(term)
    /(s|hr|hconres|sconres|hjres|sres)\d{1,4}-\d{1,3}/ =~ term
  end

  def tag_bill
    tag_type = "bill"
    bill = Bill.find_by(bill_id: params[:item_id])

    Tag.create(user_id: params[:user_id], tag_type: tag_type,
             tagged_item_id: bill.id)
  end

  def tag_legislator
    tag_type = "legislator"
    legislator = Legislator.find_by(bioguide_id: params[:item_id])

    Tag.create(user_id: params[:user_id], tag_type: tag_type,
             tagged_item_id: legislator.id)
  end
end
