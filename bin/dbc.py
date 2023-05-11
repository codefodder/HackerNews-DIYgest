import psycopg

def connect_to_db(url):
    # Connect to PostgreSQL database
    pg_conn = psycopg.connect(url)
    pg_cursor = pg_conn.cursor()
    return pg_conn

def disconnect_from_db(connection, cursor):
    # commit changes and close the database connection
    connection.commit()
    cursor.close()
    connection.close()
