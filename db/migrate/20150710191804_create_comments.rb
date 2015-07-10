class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :body, :string
      t.column :user_id, :integer
    end

  end
end
