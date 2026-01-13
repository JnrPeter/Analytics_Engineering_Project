import os

# Source table -> Staging table mappings
tables = {
    "customer": "stg_customer",
    "employees": "stg_employees",
    "employee_privileges": "stg_employee_privileges",
    "privileges": "stg_privileges",
    "inventory_transaction_types": "stg_inventory_transaction_types",
    "shippers": "stg_shippers",
    "orders_tax_status": "stg_order_tax_status",
    "orders_status": "stg_order_status",
    "orders": "stg_orders",
    "products": "stg_products",
    "purchase_orders": "stg_purchase_order",
    "suppliers": "stg_suppliers",
    "inventory_transactions": "stg_inventory_transactions",
    "invoices": "stg_invoices",
    "order_details_status": "stg_order_detail_status",
    "order_details": "stg_order_details",
    "purchase_order_details": "stg_purchase_order_details",
}

# Output directory
output_dir = r"C:\Users\penni\Documents\Analytics_Engineering_Project\northwind_dwh\models\staging"
os.makedirs(output_dir, exist_ok=True)

# Generate each staging model
for source_table, stg_table in tables.items():
    filename = f"{stg_table}.sql"
    filepath = os.path.join(output_dir, filename)
    
    content = f"""with source as (
    select * from {{{{ source('northwind', '{source_table}') }}}}
),

staged as (
    select *
    from source
)

select * from staged
"""
    
    with open(filepath, "w") as f:
        f.write(content)
    
    print(f"Created: {filename}")

print(f"\nDone! {len(tables)} staging models created in {output_dir}")