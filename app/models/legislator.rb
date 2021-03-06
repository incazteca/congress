class Legislator < ActiveRecord::Base
  has_many :bills
  lookup_for :chamber
  lookup_for :leadership_role
  lookup_for :party

  def name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def tagged?(user)
    return if user.nil?
    tags = Tag.where('user_id = ? AND tag_type_id = ?',
                     user.id, TagType.find_by(tag_type: 'legislator'))

    tags.map(&:tagged_item_id).include? id
  end

  def tag_id(user)
    return if user.nil?
    tag = Tag.where('user_id = ? AND tag_type_id = ? AND tagged_item_id = ?',
                     user.id, TagType.find_by(tag_type: 'legislator'), id).first

    return tag.id unless tag.nil?
  end
end
