class AddCoverToImages < ActiveRecord::Migration[5.2]
  def change
    add_attachment :images, :cover
  end
end
