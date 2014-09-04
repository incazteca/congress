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

    short_title.first.title
  end

  def popular_title
    type = 'popular'
    popular_title = titles.select do |t|
      t.title_type_id == TitleType.find_by(title_type: type).id
    end

    popular_title.first.title
  end
end
