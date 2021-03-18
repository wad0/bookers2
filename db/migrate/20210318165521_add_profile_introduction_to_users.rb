class AddProfileIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :plofile_introduction, :text
  end
end
