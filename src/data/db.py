from flask_mysqldb import MySQL

from models.book import Books
from models.employee import Employee


class Database:
    def __init__(self, db: MySQL = None) -> None:
        self.db = db

    def auth(self, username: str, password: str):
        sql = """
            SELECT e.id, e.first_name, e.last_name
            FROM Employees e
            INNER JOIN Accounts a ON e.id = a.employee_id
            WHERE a.username = %s AND a.password = %s;
        """

        try:
            with self.db.connection.cursor() as cursor:
                cursor.execute(sql, (username, password))
                result = cursor.fetchone()
                if result:
                    print(result)
                    return Employee(id=result['id'], fname=result['first_name'], lname=result['last_name'])
                else:
                    return None
        except Exception as e:
            print(f"Error xx: {e}")
            raise Exception(e)

    def fetch_all_books(self) -> list:
        sql = """
            SELECT
                b.id, b.isbn, b.title, b.category, b.pub_year, a.author_name, p.pub_name
            FROM
                Publishers p
            INNER JOIN Books b
                ON p.id=b.pub_id
            INNER JOIN Authors a
                ON b.author_id=a.id
            ORDER BY b.title;
        """
        try:
            with self.db.connection.cursor() as cursor:
                cursor.execute(sql)
                results = cursor.fetchall()
                books = []
                for result in results:
                    book = Books(
                        result["id"],
                        result["isbn"],
                        result["title"],
                        result["category"],
                        result["pub_year"],
                        result["author_name"],
                        result["pub_name"],
                    )
                    books.append(book)
                    print(book)
                return books

        except Exception as e:
            # Handle any exceptions, such as logging the error
            print(f"Error: {e}")
            raise Exception(e)
