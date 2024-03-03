import mysql.connector
import config

try:
    connection = mysql.connector.connect(
        host = config.host,
        user = config.user,
        password = config.password,
        database = config.database
    )
    print("Connection successful!")
    
except mysql.connector.Error as err:
    print(f"Error: {err}")
    
finally:
    if connection.is_connected():
        connection.close()
