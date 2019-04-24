class CreateSecretCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :secret_codes do |t|
      t.string :code
      t.references :user, index: { unique: true, where: 'user_id IS NOT NULL' }

      t.timestamps
    end

    add_index :secret_codes, :code, unique: true
  end
end
