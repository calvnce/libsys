class Fine:
    def __init__(self, id, book, member, issued_on, due_on, fine):
        self.id = id
        self.book = book
        self.member = member
        self.issued_on = issued_on
        self.due_on = due_on
        self.fine_amount = fine

    def __str__(self):
        return (
            f"Record ID: {self.id}, Book: {self.book}, Member ID: {self.member}, "
            f"Issued On: {self.issued_on}, Due On: {self.due_on}, Fine: {self.fine_amount}"
        )
