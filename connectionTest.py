import mysql.connector
import config

def testConnection():
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

def createTable():
    connection = mysql.connector.connect(
            host = config.host,
            user = config.user,
            password = config.password,
            database = config.database
        )
    print("Connection successful!")
    
    # Create cursor
    cursor = connection.cursor()

    # Create User table
    cursor.execute("""
        CREATE TABLE User (
            UserID INT PRIMARY KEY AUTO_INCREMENT,
            Username VARCHAR(255) NOT NULL,
            FirstName VARCHAR(255) NOT NULL,
            LastName VARCHAR(255) NOT NULL,
            Email VARCHAR(255) NOT NULL,
            StravaEmail VARCHAR(255),
            Password VARCHAR(255) NOT NULL
        )
    """)

    # Create Activity table
    cursor.execute("""
        CREATE TABLE Activity (
            ActivityID INT PRIMARY KEY AUTO_INCREMENT,
            UserID INT,
            Name VARCHAR(255) NOT NULL,
            Type VARCHAR(255) NOT NULL,
            Description TEXT,
            Datetime DATETIME,
            StartDatetime DATETIME,
            EndDatetime DATETIME,
            RouteMap VARCHAR(255),
            Distance FLOAT,
            Steps INT,
            WasteCount INT,
            FOREIGN KEY (UserID) REFERENCES User(UserID)
        )
    """)

    connection.close()
