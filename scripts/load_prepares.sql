DEALLOCATE get_column_name;
PREPARE get_column_name (text) AS
    SELECT column_name from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME =$1;


DEALLOCATE get_column_name;
PREPARE get_column_name (text) AS
    SELECT column_name from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME =$1;
