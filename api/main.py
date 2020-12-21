from flask import Flask, render_template, request, session, redirect
import sqlite3
from database import initdb

initdb()

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

    return "success"


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
                return redirect('/dashboard')
            else:
                return "failure"

@app.route('/signout')
def signout():
    if "email" in session:
        session.pop("email", None)
        print("User has signed out")
        return "successfully signed out"

@app.route('/dashboard')
def dashboard():
    # if "email" in session:
    #     with sqlite3.connect('podcast.db') as conn:
    #         c =conn.cursor()
    #         c.execute("""SELECT * FROM PODCAST""")
    return render_template('dashboard.html')
        

    

        
