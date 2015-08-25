require 'elasticsearch/model'
class Gist < ActiveRecord::Base
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  belongs_to :company
  belongs_to :category

  def self.search(search)
    where("user LIKE ? OR name LIKE ? OR gists_id LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end

end
