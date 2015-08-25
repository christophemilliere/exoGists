require 'elasticsearch/model'
class Gist < ActiveRecord::Base
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  belongs_to :company
  belongs_to :category

  def self.search(search)
    where("user LIKE ? OR name LIKE ? OR gists_id LIKE ? OR category_id LIKE ?", "%#{search}%","%#{search}%","%#{search}%","%#{self.search_category(search)}%")
  end
  def self.search_category(search)
    cat = Category.find_by_name(search)
    return cat.id if !cat.blank?
  end

end
