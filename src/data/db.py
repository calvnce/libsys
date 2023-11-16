from flask_mysqldb import MySQL

from models.book import Books
from models.borrow import Borrowing
from models.employee import Employee
from models.fine import Fine
from models.member import Member


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
                    return Employee(
                        id=result["id"],
                        fname=result["first_name"],
                        lname=result["last_name"],
                    )
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

    def fetch_all_borrowings(self) -> list:
        sql = """
            SELECT m.first_name, m.last_name, b.title, br.id, br.issued_on, br.due_on
            FROM Books b
            INNER JOIN Borrowings br
            ON b.id=br.book_id
            INNER JOIN Members m
            ON m.id=br.member_id;
        """
        try:
            with self.db.connection.cursor() as cursor:
                cursor.execute(sql)
                results = cursor.fetchall()
                borrowings = []
                for result in results:
                    borrow = Borrowing(
                        result["id"],
                        result["title"],
                        f'{result["first_name"]} {result["last_name"]}',
                        result["issued_on"],
                        result["due_on"],
                    )
                    borrowings.append(borrow)
                    print(borrow)
                return borrowings

        except Exception as e:
            # Handle any exceptions, such as logging the error
            print(f"Error: {e}")
            raise Exception(e)

    def fetch_all_fines(self) -> list:
        sql = """
            SELECT 
                m.first_name, m.last_name, b.title, br.issued_on, br.due_on, f.id, f.amount
            FROM Books b
            INNER JOIN Borrowings br
            ON b.id=br.book_id
            INNER JOIN Members m
            ON m.id=br.member_id
            INNER JOIN Fines f
            ON br.id=f.borrowing_id;
        """
        try:
            with self.db.connection.cursor() as cursor:
                cursor.execute(sql)
                results = cursor.fetchall()
                fines = []
                for result in results:
                    fine = Fine(
                        result["id"],
                        result["title"],
                        f'{result["first_name"]} {result["last_name"]}',
                        result["issued_on"],
                        result["due_on"],
                        result["amount"],
                    )
                    fines.append(fine)
                    print(fine)
                return fines

        except Exception as e:
            # Handle any exceptions, such as logging the error
            print(f"Error: {e}")
            raise Exception(e)

    def fetch_all_members(self) -> list:
        sql = """
            SELECT * FROM Members ;
        """
        try:
            with self.db.connection.cursor() as cursor:
                cursor.execute(sql)
                results = cursor.fetchall()
                members = []
                for result in results:
                    member = Member(
                        id=result["id"],
                        name=f'{result["first_name"]} {result["last_name"]}',
                        gender=result["gender"],
                        address=result["address"],
                        email=result["email"],
                        phone=result["phone"],
                        status=result["status"],
                        category=result["category"],
                        joined_on=result["joined_on"],
                    )
                    members.append(member)
                    print(member)
                return members

        except Exception as e:
            # Handle any exceptions, such as logging the error
            print(f"Error: {e}")
            raise Exception(e)
