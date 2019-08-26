class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :text
      t.string :image
      t.references :next_question, foreign_key: { to_table: :questions }
      t.string :final_path

      t.timestamps
    end
  end
end
