class CreateJobOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :job_orders, :id => false do |t|
      t.integer :job_order_number, primary_key: true
      t.string :service
      t.string :department
      t.string :description
      t.string :status, default: "IN QUEUE"
      t.string :remarks, default: "-"
      t.date :remarks_as_of, default: Date.today
      t.string :classification, default: "-"
      t.string :engineering_unit, default: "-"
      t.string :created_at_month, default: Date.today.strftime("%m")
      t.string :created_at_day, default: Date.today.strftime("%d")
      t.string :created_at_year, default: Date.today.strftime("%Y")

      t.timestamps
    end
  end
end
