class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :body
    end
  end
end
