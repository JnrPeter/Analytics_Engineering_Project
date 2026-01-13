WITH employees AS (
    SELECT *
    FROM {{ ref('stg_employees') }}
)

SELECT
    id AS employee_id,
    company,
    last_name,
    first_name,
    email_address,
    job_title,
    business_phone,
    home_phone,
    mobile_phone,
    fax_number,
    address,
    city,
    state_province,
    zip_postal_code,
    country_region,
    web_page,
    notes,
    attachments,
    CURRENT_DATETIME() AS insertion_timestamp
FROM employees