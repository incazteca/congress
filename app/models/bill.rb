class Bill < ActiveRecord::Base
  belongs_to :legislator
  lookup_for :chamber
  has_many :titles

  def official_title
    type = 'official'
    official_title = titles.select do |t|
      t.title_type_id == TitleType.find_by(title_type: type).id
    end

    official_title.first.title
  end

  def short_title
    type = 'short'
    short_title = titles.select do |t|
      t.title_type_id == TitleType.find_by(title_type: type).id
    end

    return short_title.first.title unless short_title.first.nil?
    return "Short title not available" if short_title.first.nil?
  end

  def popular_title
    type = 'popular'
    popular_title = titles.select do |t|
      t.title_type_id == TitleType.find_by(title_type: type).id
    end

    return popular_title.first.title unless popular_title.first.nil?
    return "Popular title not available" if popular_title.first.nil?
  end
end
