json.extract! list_item, :id, :name, :details, :due, :status, :user_id, :category_id, :created_at, :updated_at
json.url list_item_url(list_item, format: :json)
