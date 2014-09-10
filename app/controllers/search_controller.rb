require 'will_paginate'

class SearchController < ApplicationController
  def index

    search_term = params[:search_term].strip.downcase

    # Redirect to bill if search seems like a bill id
    redirect_to bill_path(Bill.find_by(bill_id: search_term)) and return if /(s|hr)\d{1,4}-\d{1,3}/ =~ search_term

    # Redirect to legislators if search seems like a bioguide_id, only time upcase needed
    redirect_to legislator_path(Legislator.find_by(bioguide_id: search_term.upcase)) and return if /[A-Z]\d{6}/ =~ search_term.upcase

    @legislators = Legislator.
      where('lower(first_name) LIKE ? OR lower(last_name) LIKE ?', "%#{search_term}%", "%#{search_term}%").
      paginate(page: params[:page], per_page: 15)

    titles = Title.where('lower(title) LIKE ?', "%#{search_term}%")
    @bills = Bill.paginate(page: params[:page], per_page: 15).find(titles.map(&:bill_id)) unless titles.nil?

    redirect_to legislator_path(@legislators.first) and return if @legislators.count == 1
    redirect_to bill_path(@bills.first) and return if @bills.count == 1

  end
end
