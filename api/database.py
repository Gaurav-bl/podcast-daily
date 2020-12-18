import sqlite3

def initdb():
    with sqlite3.connect('podcast.db') as conn:
        c = conn.cursor()

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
            PRIMARY KEY(STREAM_ID));
            """)

        c.execute("""CREATE TABLE IF NOT EXISTS PODCAST(
            POD_NAME TEXT,
            POD_ID TEXT,
            POD_LIB TEXT,
            POD_DATE TEXT,
            PRIMARY KEY(POD_ID));
            """)

        c.execute("""CREATE TABLE IF NOT EXISTS RATING_AND_REVIEW(
            REVIEW TEXT,
            RATING TEXT,
            RR_ID TEXT,
            PRIMARY KEY(RR_ID));
            """)        

initdb()