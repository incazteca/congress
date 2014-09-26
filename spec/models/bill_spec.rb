require 'rails_helper'

RSpec.describe Bill, type: :model do
  let (:bill) { Bill.find_by(bill_id: 'hr2642-113') }

  it 'has an official title' do
    create(:official_type)
    create(:short_type)
    create(:popular_type)
    create(:title)
    expect(build(:bill).official_title).not_to be_nil
  end

  it 'has a short title' do
    create(:official_type)
    create(:short_type)
    create(:popular_type)
    create(:title)
    expect(build(:bill).short_title).not_to be_nil
  end

  it 'has a popular title' do
    create(:official_type)
    create(:short_type)
    create(:popular_type)
    create(:title)
    expect(build(:bill).popular_title).not_to be_nil
  end

end
