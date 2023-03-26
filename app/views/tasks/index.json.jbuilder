# json.extract! @tasks,:title, :description, :due_date, :completed
# json.array! @tasks,partial: 'tasks/task', as::task
json.array! @tasks do |task|
  json.id task.id
  json.title task.title
  json.description task.description
  json.due_date task.due_date
  json.completed task.completed
  json.created_at task.created_at
  json.updated_at task.updated_at
end
