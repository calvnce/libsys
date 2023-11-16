import datetime


class Member:
    def __init__(
        self,
        id,
        name,
        gender,
        address,
        email,
        phone,
        joined_on,
        category="Basic",
        status="Active",
    ):
        self.id = id
        self.name = name
        self.gender = gender
        self.address = address
        self.email = email
        self.phone = phone
        self.category = category
        self.status = status
        self.joined_on = joined_on
        self.ends_on = self.joined_on + datetime.timedelta(days=365)
        self.created_at = datetime.datetime.now()

    def __str__(self):
        return f"Member ID: {self.id}, Name: {self.name}, Email: {self.email}"
