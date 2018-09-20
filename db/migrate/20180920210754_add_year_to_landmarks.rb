class AddYearToLandmarks < ActiveRecord::Migration
  def change
    add_column :landmarks, :year_completed, :integer
  end
end
