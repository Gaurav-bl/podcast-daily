from flask import Flask, render_template, request
import sqlite3
from database import initdb

initdb()

app = Flask(__name__)

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
