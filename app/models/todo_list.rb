class TodoList < ApplicationRecord
  validates :title, presence: true

  after_create_commit -> { broadcast_prepend_later_to "todo_lists" }
  after_update_commit -> { broadcast_update_later_to "todo_lists" }
  after_destroy_commit -> { broadcast_remove_later_to "todo_lists" }
end
