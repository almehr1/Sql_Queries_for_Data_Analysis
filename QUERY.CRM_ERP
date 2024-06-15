CREATE TABLE erp_accounts (
  account_id VARCHAR(255),
  name VARCHAR(255),
  industry VARCHAR(255),
  annual_revenue DECIMAL(18,2),
  phone VARCHAR(20)
);

LOAD DATA INFILE 's3://your-s3-bucket/salesforce-data/accounts.csv'
INTO TABLE erp_accounts
FORMAT = CSV
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(account_id, name, industry, annual_revenue, phone);

MERGE INTO erp_accounts USING erp_accounts_ext
ON erp_accounts.account_id = erp_accounts_ext.account_id
WHEN MATCHED THEN
  UPDATE SET
    name = erp_accounts_ext.name,
    industry = erp_accounts_ext.industry,
    annual_revenue = erp_accounts_ext.annual_revenue,
    phone = erp_accounts_ext.phone
WHEN NOT MATCHED THEN
  INSERT (
    account_id,
    name,
    industry,
    annual_revenue,
    phone
  )
  VALUES (
    erp_accounts_ext.account_id,
    erp_accounts_ext.name,
    erp_accounts_ext.industry,
    erp_accounts_ext.annual_revenue,
    erp_accounts_ext.phone
  );
