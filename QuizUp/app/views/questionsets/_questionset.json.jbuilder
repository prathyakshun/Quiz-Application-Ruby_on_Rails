json.extract! questionset, :id, :number_correct, :User_id, :Genre_id, :Subgenre_id, :created_at, :updated_at
json.url questionset_url(questionset, format: :json)
