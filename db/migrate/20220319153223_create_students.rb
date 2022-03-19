class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.integer :instructor_id
      t.string :name
      t.string :major
      t.integer :age

      t.timestamps
    end
  end
end
