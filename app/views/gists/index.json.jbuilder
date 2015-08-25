json.array!(@gists) do |gist|
  json.extract! gist, :id, :name, :user, :avatar, :gists_id, :company_id, :category_id
  json.url gist_url(gist, format: :json)
end
