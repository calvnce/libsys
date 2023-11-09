from flask_mysqldb import MySQL

from models.book import Books


class Database:
    def __init__(self, db: MySQL = None) -> None:
        self.db = db

    def seed(self):
        sql = """

        """
        cursor = self.db.connection.cursor()
        try:
            # Execute the SQL statements
            cursor.execute(sql)
        except Exception as e:
            # Handle any exceptions, such as logging the error
            print(f"Error: {e}")
            raise Exception(e)
        finally:
            cursor.close()

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
                    _id, isbn, title, category, pub_year, author_name, pub_name = result
                    book = Books(_id, isbn, title, category, pub_year, author_name, pub_name)
                    books.append(book)
                return books  
            
        except Exception as e:
            # Handle any exceptions, such as logging the error
            print(f"Error: {e}")
            raise Exception(e)

