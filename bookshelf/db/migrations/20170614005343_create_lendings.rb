Hanami::Model.migration do
  change do
    create_table :lendings do
      primary_key :id

      column :title,  String, null: false
      column :first_name, String, null: false
      column :last_name, String, null: false
      column :address, String, null: false
      column :phone, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
