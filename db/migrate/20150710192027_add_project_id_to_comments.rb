class AddProjectIdToComments < ActiveRecord::Migration
  def change
    add_column(:comments, :project_id, :number)
  end
end
