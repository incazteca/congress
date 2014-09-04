require 'rails_helper'

RSpec.describe Bill, :type => :model do
  let (:bill) { Bill.find_by(bill_id: 'hr2642-113') }

  it "has an official title" do
    expect(bill.official_title).not_to be_nil
  end

  it "has a short title" do
    expect(bill.short_title).not_to be_nil
  end

  it "has a popular title" do
    expect(bill.popular_title).not_to be_nil
  end

end
