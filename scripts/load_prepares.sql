DEALLOCATE get_column_name;
PREPARE get_column_name (text) AS
    SELECT column_name from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME =$1;



PREPARE get_row(text, text) AS
    EXECUTE format('SELECT %1 '
   'FROM $2') USING $1, $2;
