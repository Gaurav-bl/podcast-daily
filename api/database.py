import sqlite3

def initdb():
    with sqlite3.connect('podcast.db') as conn:
        c = conn.cursor()
        c.execute("PRAGMA FOREIGN_KEYS=ON;")

        c.execute("""CREATE TABLE IF NOT EXISTS USERS(
            USER_ID TEXT,
            EMAIL TEXT,
            PASSWORD TEXT,
            PRIMARY KEY(USER_ID));
        """)
        conn.commit()

        c.execute("""CREATE TABLE IF NOT EXISTS STREAM(
            STREAM_NAME TEXT,
            STREAM_URL TEXT,
            STREAM_ID TEXT,
            STREAM_LOGO TEXT,
            PRIMARY KEY(STREAM_ID));
        """)

        c.execute("""CREATE TABLE IF NOT EXISTS CATEGORY(
            CAT_ID INT,
            CAT_NAME TEXT,
            CAT_IMG TEXT,
            PRIMARY KEY(CAT_ID));
        """)

        c.execute("""CREATE TABLE IF NOT EXISTS PODCAST(
            POD_NAME TEXT,
            POD_ID INT,
            POD_IMG TEXT,
            POD_STUDIO TEXT,
            POD_INFO TEXT,
            C_ID INT,
            PRIMARY KEY(POD_ID)
            FOREIGN KEY(C_ID) REFERENCES CATEGORY(CAT_ID) ON DELETE CASCADE);
        """)

        c.execute("""CREATE TABLE IF NOT EXISTS POD_RATING(
            POD_ID INT,
            RATING REAL DEFAULT 0.0,
            NO_OF_RATING INT DEFAULT 0,
            PRIMARY KEY(POD_ID),
            FOREIGN KEY(POD_ID) REFERENCES PODCAST(POD_ID) ON DELETE CASCADE);
        """)
        
        c.execute("""CREATE TABLE IF NOT EXISTS USER_RATED(
            USER_ID TEXT,
            POD_ID INT,
            RATING REAL,
            REVIEW TEXT,
            PRIMARY KEY(USER_ID, POD_ID),
            FOREIGN KEY(USER_ID) REFERENCES USERS(USER_ID) ON DELETE CASCADE,
            FOREIGN KEY(POD_ID) REFERENCES PODCAST(POD_ID) ON DELETE CASCADE
        );""")

        c.execute("""CREATE TABLE IF NOT EXISTS LIBRARY(
            USER_ID TEXT,
            POD_ID INT,
            PRIMARY KEY(USER_ID, POD_ID)
            FOREIGN KEY(USER_ID) REFERENCES USERS(USER_ID) ON DELETE CASCADE,
            FOREIGN KEY(POD_ID) REFERENCES PODCAST(POD_ID) ON DELETE CASCADE
        );""")


        c.execute("""CREATE TRIGGER ADD_RATING_TO_NEW_PODCAST AFTER INSERT ON PODCAST
            BEGIN
                INSERT INTO POD_RATING(POD_ID) VALUES (NEW.POD_ID);
            END;
        """)
        
        c.execute("""
			CREATE TRIGGER ADD_NEW_RATING AFTER INSERT ON USER_RATED
			BEGIN
				UPDATE POD_RATING 
				SET RATING=((RATING * NO_OF_RATING + NEW.RATING)/(NO_OF_RATING + 1)),
				NO_OF_RATING=(NO_OF_RATING + 1)
				WHERE POD_RATING.POD_ID=NEW.POD_ID;
			END;
		""")

        c.execute("""
                CREATE TRIGGER UPDATE_RATING AFTER UPDATE ON USER_RATED
                WHEN OLD.RATING <> NEW.RATING
                BEGIN
                    UPDATE POD_RATING
                    SET RATING=((RATING * NO_OF_RATING + NEW.RATING - OLD.RATING)/(NO_OF_RATING))
                    WHERE POD_RATING.POD_ID=NEW.POD_ID;
                END;
        """)

        conn.commit()
            

initdb()