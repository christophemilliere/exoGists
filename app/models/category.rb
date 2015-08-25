class Category < ActiveRecord::Base
  has_many :gists
end
