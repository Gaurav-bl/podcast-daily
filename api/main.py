from flask import Flask, render_template, request, session, redirect
import sqlite3
# from database import initdb

# initdb()

app = Flask(__name__)
app.secret_key = "secret"

@app.route('/')
@app.route('/index')
def index():
    return render_template('home.html')


@app.route('/signup')
def signup_page():
    return render_template('signup.html')


@app.route('/signup_button', methods=['POST'])
def signup():
    with sqlite3.connect('podcast.db') as conn:
        c = conn.cursor()

        user_name = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')

        c.execute("""INSERT INTO USERS(USER_ID, EMAIL, PASSWORD) VALUES(?,?,?);""", (user_name, email, password))
        
    return redirect('/signin')


@app.route('/signin')
def signin_page():
    return render_template('signin.html')

@app.route('/signin_button', methods=['POST'])
def signin():
    if "email" in session:
        return redirect('/dashboard')
    else:
        cred ={
            "usr":request.form.get("username"),
            "pwd":request.form.get("password")
        }
        with sqlite3.connect('podcast.db') as conn:
            c=conn.cursor()

            query = c.execute("""SELECT email
                        FROM USERS
                        WHERE USER_ID=(?) AND PASSWORD=(?)""", tuple(cred.values())).fetchone()

            if query is not None:
                session['email'] = query[0]
                session['username'] = cred['usr']
                return redirect('/dashboard')
            else:
                return "failure"

@app.route('/signout')
def signout():
    if "email" in session:
        session.pop("email", None)
        session.pop("username", None)

        print("User has signed out")
        return redirect('/index')

@app.route('/dashboard')
def dashboard():
    if "email" in session:
        with sqlite3.connect('podcast.db') as conn:
            c =conn.cursor()
            top_rated = c.execute("""SELECT PODCAST.* 
                                    FROM PODCAST, POD_RATING
                                    WHERE POD_RATING.POD_ID=PODCAST.POD_ID
                                    ORDER BY POD_RATING.RATING DESC;""").fetchmany(5)

            trending = c.execute("""SELECT PODCAST.* FROM PODCAST ORDER BY RANDOM()""").fetchmany(5)

            tech = c.execute("""SELECT PODCAST.* 
                                    FROM PODCAST, POD_RATING
                                    WHERE POD_RATING.POD_ID=PODCAST.POD_ID AND C_ID=1
                                    ORDER BY POD_RATING.RATING DESC;""").fetchmany(5)
            gaming = c.execute("""SELECT PODCAST.* 
                                    FROM PODCAST, POD_RATING
                                    WHERE POD_RATING.POD_ID=PODCAST.POD_ID AND C_ID=2
                                    ORDER BY POD_RATING.RATING DESC;""").fetchmany(5)
            education = c.execute("""SELECT PODCAST.* 
                                    FROM PODCAST, POD_RATING
                                    WHERE POD_RATING.POD_ID=PODCAST.POD_ID AND C_ID=3
                                    ORDER BY POD_RATING.RATING DESC;""").fetchmany(5)
            comedy = c.execute("""SELECT PODCAST.* 
                                    FROM PODCAST, POD_RATING
                                    WHERE POD_RATING.POD_ID=PODCAST.POD_ID AND C_ID=4
                                    ORDER BY POD_RATING.RATING DESC;""").fetchmany(5)

        return render_template('dashboard.html', name=session['username'], toprated=top_rated, \
            trending=trending, tech=tech, gaming=gaming, education=education, comedy=comedy)
    return redirect('/signin')



@app.route('/explore')
def explore():
    if "email" in session:
        with sqlite3.connect('podcast.db') as conn:
            c =conn.cursor()
            cat = c.execute("""SELECT * FROM CATEGORY""").fetchall()
        return render_template('explore.html', name=session['username'], cat=cat)
    return redirect('/signin')


@app.route('/category/<int:id>')
def cat(id):
    if "email" in session:
        with sqlite3.connect('podcast.db') as conn:
            c =conn.cursor()
            podcast = c.execute("""SELECT PODCAST.* FROM PODCAST WHERE C_ID=?""", (id,)).fetchall()
        return render_template('explore.html', name=session['username'], podcast=podcast)
    return redirect('/signin')


@app.route('/podcast/<int:pid>')
def render_pod(pid):
    
    if "email" in session:
        with sqlite3.connect('podcast.db') as conn:
            c =conn.cursor()
            pod = c.execute(""" SELECT PODCAST.*, RATING 
                                FROM PODCAST, POD_RATING
                                WHERE 
                                PODCAST.POD_ID=POD_RATING.POD_ID 
                                AND 
                                PODCAST.POD_ID=?
                    """, (pid,)).fetchone()
            
            reviews = c.execute(""" SELECT USER_ID, RATING, REVIEW
                                FROM USER_RATED, PODCAST
                                WHERE 
                                PODCAST.POD_ID=?
                                AND
                                PODCAST.POD_ID=USER_RATED.POD_ID;
                    """, (pid,)).fetchall()

            # print(pod)
            print(reviews)
        return render_template('podcast.html', name=session['username'], podcast=pod, reviews=reviews)
    return redirect('/signin')
