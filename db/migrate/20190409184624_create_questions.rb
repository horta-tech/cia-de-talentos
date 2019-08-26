class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :typed_texts, array: true, default: []

      t.timestamps
    end
  end
end
