class ListItem < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :due, presence: true

  attribute :status, :integer, default: 0
  enum status: {
    incomplete: 0,
    complete: 1,
  }

  scope :ordered, -> { reorder(due: :asc) }

  # get list item with same status, and due date previous to current list item due date. Used by list_items#create to insert list item into right spot in list
  def prev_list_item
    if self.status == "incomplete"
      self.user.incomplete_list_items.where("due < ?", self.due).last
    else
      self.user.complete_list_items.where("due < ?", self.due).last
    end
  end

  def due_formatted
    self.due.strftime("%b %e, %Y @ %l:%M")
  end

  def get_status_icon_text
    if self.incomplete?
      "radio_button_unchecked"
    else
      "task_alt"
    end
  end

end
