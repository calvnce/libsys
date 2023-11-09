class Books:
    def __init__(
        self,
        id: str,
        isbn: str,
        title: str,
        category: str,
        pub_year: int,
        author_name: str,
        pub_name: str,
    ):
        """
        Initialize a Books object.

        Args:
            id (str): The unique identifier for the book.
            isbn (str): The International Standard Book Number of the book.
            title (str): The title of the book.
            category (str): The category or genre of the book.
            pub_year (int): The publication year of the book.
            author_name (str): The name of the book's author.
            pub_name (str): The name of the book's publisher.
        """
        self.id = id
        self.isbn = isbn
        self.title = title
        self.category = category
        self.pub_year = pub_year
        self.author_name = author_name
        self.pub_name = pub_name

    def __str__(self) -> str:
        """
        Return a string representation of the Books object.

        Returns:
            str: A formatted string containing book details.
        """
        return (
            f"Book ID: {self.id}, ISBN: {self.isbn}, Title: {self.title}, Category: {self.category}, "
            f"Publication Year: {self.pub_year}, Author: {self.author_name}, Publisher: {self.pub_name}"
        )
