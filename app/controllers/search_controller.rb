require 'will_paginate'

class SearchController < ApplicationController
  def index
    search_term = params[:search_term].strip.downcase

    @bills = bill_search(search_term)
    @legislators = legislator_search(search_term)

    unless @bills.count > 0 && @legislators.count > 0
      redirect_to legislator_path(@legislators.first) and return if @legislators.count == 1
      redirect_to bill_path(@bills.first) and return if @bills.count == 1
    end
  end

  private

  def bill_id?(term)
    /(s|hr|hconres|sconres|hjres|sres)\d{1,4}-\d{1,3}/ =~ term
  end

  def bioguide_id?(term)
    /[a-z]\d{6}/ =~ term
  end

  def bill_search(term)
    return [Bill.find_by(bill_id: term)] if bill_id?(term)

    titles = Title.where('lower(title) LIKE ?', "%#{term}%")

    Bill.where(id: titles.map(&:bill_id)).
      paginate(page: params[:page], per_page: 15) unless titles.nil?

  end

  def legislator_search(term)
    return [Legislator.find_by(bioguide_id: term.upcase)] if bioguide_id?(term)

    Legislator.
      where('lower(first_name || \' \' || last_name) LIKE ? OR
            lower(first_name || \' \' || middle_name || \' \' || last_name) LIKE ?',
            "%#{term}%",
            "%#{term}%").
      paginate(page: params[:page], per_page: 15)
  end

end
