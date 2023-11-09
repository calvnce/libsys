from flask import Flask, redirect, render_template, request, jsonify, session, url_for
from flask_mysqldb import MySQL
from data.db import Database
from werkzeug.exceptions import HTTPException
from models.employee import Employee

from views.loginform import LogInForm

app = Flask(__name__)

# Load configuration from config.py
app.config.from_pyfile("config.py")

# Database instance
mysql = MySQL()
mysql.init_app(app)
db = Database(mysql)

ERROR_PAGE = "error.html"


@app.route("/", methods=["GET", "POST"])
@app.route("/books", methods=["GET", "POST"])
def index():
    # Retrieve the user information from the session
    user: dict = session.get("user")
    # Fetch all books from database
    books = db.fetch_all_books()

    # Handle search form submission
    query = request.args.get("query")
    if query:
        books = search_books(books, query)

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
        user = db.auth(username=form.username.data, password=form.password.data)

        # Check if user authentication was successful
        if user is not None:
            # Store user information in the session
            session["user"] = {"name": user.first_name, "id": user.id}
            # Redirect to a protected page (e.g., index)
            return redirect(url_for("index"))

        form.errors["auth"] = "Invalid username or password"
        return render_template("login.html", form=form)

    return render_template("login.html", form=form)


# Route to render the login form
@app.route("/logout", methods=["GET"])
def logout():
    session.popitem("user")
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


def search_books(books, query):
    results = []
    for book in books:
        if (
            query.lower() in book.title.lower()
            or query.lower() in book.author_name.lower()
        ):
            results.append(book)
    return results


if __name__ == "__main__":
    app.run()
