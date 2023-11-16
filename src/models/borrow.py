class Borrowing:
    def __init__(self, id, book, member, issued_on, due_on):
        self.id = id
        self.book = book
        self.member = member
        self.issued_on = issued_on
        self.due_on = due_on

    def __str__(self):
        return (
            f"Borrowing ID: {self.id}, Book: {self.book}, Member ID: {self.member}, "
            f"Issued On: {self.issued_on}, Due On: {self.due_on}"
        )
