class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :sent_to

      t.timestamps
    end
  end
end
