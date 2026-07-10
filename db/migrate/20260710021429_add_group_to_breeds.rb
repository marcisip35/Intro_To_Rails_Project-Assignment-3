class AddGroupToBreeds < ActiveRecord::Migration[8.1]
  def change
    add_reference :breeds, :group, null: false, foreign_key: true
  end
end
