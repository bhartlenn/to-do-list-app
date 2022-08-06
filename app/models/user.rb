class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :list_items

  def incomplete_list_items
    list_items_of_status('incomplete')
  end

  def complete_list_items
    list_items_of_status('complete')
  end

  private
  def list_items_of_status(status)
    list_items.where( status: status ).ordered
  end
end
