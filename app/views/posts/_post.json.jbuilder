json.extract! post, :id, :author_id, :title, :text, :comment_counter, :likes_counter, :created_at, :updated_at
json.url post_url(post, format: :json)
