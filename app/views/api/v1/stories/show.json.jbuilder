# app/views/api/v1/stories/show.json.jbuilder
json.extract! @story, :id, :name, :text
json.comments @story.comments do |comment|
  json.extract! comment, :id, :content, :name
  json.date comment.created_at.strftime("%m/%d/%y")
end
