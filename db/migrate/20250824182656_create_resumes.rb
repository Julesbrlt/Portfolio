class CreateResumes < ActiveRecord::Migration[7.1]
  def change
    create_table :resumes do |t|
      t.string :title
      t.string :pdf_url

      t.timestamps
    end
  end
end
