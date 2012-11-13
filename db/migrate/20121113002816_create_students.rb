class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, :state
    end
  end
end
