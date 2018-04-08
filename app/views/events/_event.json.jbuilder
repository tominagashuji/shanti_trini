json.extract! event, :id, :title, :content, :image, :yoggy_id, :created_at, :updated_at
json.url event_url(event, format: :json)
