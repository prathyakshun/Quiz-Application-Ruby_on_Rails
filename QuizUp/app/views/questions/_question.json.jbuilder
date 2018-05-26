json.extract! question, :id, :questiontext, :Genre_id, :Subgenre_id, :qtype, :created_at, :updated_at
json.url question_url(question, format: :json)
