from faker import Faker
import random

fake = Faker()
# Generate random employee details
EMPLOYEE_FIRST_NAME = fake.first_name()

EMPLOYEE_MIDDLE_NAME = random.choice(["Ali", "Mohamed", "Youssef", "Said", "Ibrahim"])
EMPLOYEE_LAST_NAME = fake.last_name()
EMPLOYEE_ID = random.randint(10000, 99999)

# Generate random vacancy details
VACANCY_NAME = f"{fake.job()} Vacancy"
NUM_POSITIONS = random.randint(1, 5)
CANDIDATE_EMAIL = fake.email()

# Generate random user name and password
NEW_USER_USERNAME = f"{EMPLOYEE_FIRST_NAME}{random.randint(1000,9999)}"
NEW_USER_PASSWORD = fake.password(length=10, special_chars=True, digits=True, upper_case=True, lower_case=True)
    

