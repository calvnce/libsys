class Employee:
    def __init__(
        self,
        id: str = None,
        fname: str = None,
        lname: str = None,
        gender: str = None,
        address: str = None,
        email: str = None,
        phone: str = None,
    ) -> None:
        """
        Employee class represents an employee in the organization.

        Args:
            fname (str): The first name of the employee.
                Example: "John"

            lname (str): The last name of the employee.
                Example: "Doe"

            gender (str): The gender of the employee.
                Example: "Male" or "Female"

            address (str): The address of the employee.
                Example: "123 Main St, City, Country"

            email (str): The email address of the employee.
                Example: "john.doe@example.com"

            phone (str): The phone number of the employee.
                Example: "+1 (555) 123-4567"
        """
        self.id = id
        self.first_name = fname
        self.last_name = lname
        self.gender = gender
        self.address = address
        self.email = email
        self.phone = phone
