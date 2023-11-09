from flask import Flask, redirect, render_template, request, jsonify, url_for
from flask_mysqldb import MySQL
from data.db import Database
from werkzeug.exceptions import HTTPException

from views.loginform import LogInForm

app = Flask(__name__)

# Load configuration from config.py
app.config.from_pyfile("config.py")

# Database instance
mysql = MySQL()
mysql.init_app(app)
db = Database(mysql)

ERROR_PAGE = "error.html"


@app.route("/")
@app.route("/books")
def index():
    # Details of authenticated user
    user = request.args.get("user")
    # Fetch all books from database
    books = db.fetch_all_books()
    
    return render_template("index.html", books=books, user=user)


@app.route("/members")
def members():
    return render_template("members.html")


@app.route("/borrowings")
def borrowings():
    return render_template("borrowings.html")


@app.route("/fines")
def fines():
    return render_template("fines.html")


# Route to render the login form
@app.route("/login", methods=["GET", "POST"])
def login():
    form = LogInForm()
    if request.method == "POST" and form.validate_on_submit():
        username = form.username.data
        password = form.password.data

        # Confirm from Database
        if username == "calvnce" and password == "kolly2012":
            user = "calvince"
            # Successful login, redirect to a protected page
            return redirect(url_for("index", user=user))

        form.errors["auth"] = "Invalid username or password"
        return render_template("login.html", form=form)

    return render_template("login.html", form=form)


# Route to render the login form
@app.route("/logout", methods=["GET"])
def logout():
    return redirect(url_for("index"))


# Error handler for application errors
@app.errorhandler(Exception)
def handle_error(error):
    http_status_code = getattr(error, "code", 500)
    app.logger.error(
        f"An error occurred with HTTP status code {http_status_code}: {str(error)}"
    )

    if request.headers.get("Content-Type") == "application/json":
        return jsonify(error=str(error)), http_status_code
    else:
        return render_template(ERROR_PAGE, error_message=str(error)), http_status_code


@app.route("/not_found")
def not_found():
    raise HTTPException("Resource not found", code=404)


if __name__ == "__main__":
    app.run()
