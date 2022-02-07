json.extract! movie, :id, :title, :description, :number_of_likes, :number_of_hates, :user_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
