🎯 Overview
This automation suite covers critical functionalities of the OrangeHRM application including:

Employee Management (PIM Module)
Recruitment Module
User Administration

The framework follows Page Object Model (POM) design pattern with reusable keywords and dynamic test data generation using Faker library.

✨ Features

✅ Page Object Model (POM) implementation
✅ Browser Library for faster and more reliable test execution
✅ Dynamic Test Data generation using Faker
✅ Singleton Pattern for consistent data across test cases
✅ Proper Test Tagging (smoke/regression)
✅ Detailed HTML Reports with screenshots on failure
✅ Clean and Maintainable Code
✅ Cross-browser Support (Chrome, Firefox, Edge)

📦 Prerequisites
Before installing the automation suite, ensure you have the following:
Required Software:

Python 3.8+ - Download Python
pip (Python package manager - comes with Python)
Git (optional, for cloning repository)

Verify Installation:
bashpython --version
pip --version

🚀 Installation
Follow these steps to set up the automation framework:
Step 1: Clone or Download the Repository
Option A: Using Git
bashgit clone https://github.com/yourusername/orangehrm-automation.git
cd orangehrm-automation
Option B: Download ZIP

Download the project ZIP file
Extract to your desired location
Open terminal/command prompt in the extracted folder

Step 2: Install Python Dependencies
Install all required Python packages:
bashpip install robotframework
pip install robotframework-browser
pip install faker

Step 3: Initialize Browser Library
This step downloads the necessary browser binaries (Chromium, Firefox, WebKit):
bashrfbrowser init
Note: This may take a few minutes as it downloads browser binaries (~300MB).

Step 4: Verify Installation
Check if Robot Framework is installed correctly:
bashrobot --version

```

Expected output:
```

Robot Framework 7.x.x (Python 3.x.x on win32)

```

---

## 📁 Project Structure
```

OrangeHRM_Automation/
│
├── Pages/ # Page Object Model (POM)
│ ├── LoginPage.robot # Login page locators and keywords
│ ├── PIMPage.robot # PIM module locators and keywords
│ ├── RecruitmentPage.robot # Recruitment module locators and keywords
│ └── AdminPage.robot # Admin module locators and keywords
│
├── Tests/ # Test Cases
│ ├── PIM_Tests.robot # Employee management tests (TC01, TC02)
│ ├── Recruitment_Tests.robot # Recruitment tests (TC03, TC04)
│ └── Admin_Tests.robot # Admin tests (TC05)
│
├── Resources/ # Reusable Keywords & Variables
│ ├── Variables.robot # Global variables and configurations
│ └── TestDataLibrary.robot # Test data generation keywords
│
├── random_variables.py # Python library for generating test data
├── Results/ # Test execution reports (auto-generated)
├── test_data.json # Cached test data (auto-generated)
└── README.md # This file

🧪 Test Cases
TC01: Create Employee (PIM Module)

Tag: smoke
Description: Login to application, navigate to PIM, create a new employee, and verify success
Module: PIM

TC02: Search Employee

Tag: regression
Description: Search for the created employee and verify all data is saved correctly
Module: PIM

TC03: Create Vacancy (Recruitment Module)

Tag: smoke
Description: Navigate to Recruitment, create a job vacancy, and verify success
Module: Recruitment

TC04: Add Candidate

Tag: regression
Description: Add a new candidate to the recruitment system and verify success
Module: Recruitment

TC05: Create System User and Login

Tag: smoke
Description: Create a new system user, logout, login with new credentials, and verify success
Module: Admin

⚡ Execution Commands
Basic Execution
Run All Test Cases
bashrobot -d Results Tests/
Run Specific Test Suite
bashrobot -d Results Tests/PIM_Tests.robot
robot -d Results Tests/Recruitment_Tests.robot
robot -d Results Tests/Admin_Tests.robot

Tag-Based Execution
Run Only Smoke Tests
bashrobot -d Results -i smoke Tests/
Run Only Regression Tests
bashrobot -d Results -i regression Tests/
Exclude Specific Tags
bashrobot -d Results -e regression Tests/

Advanced Execution Options
Run with Different Browser
bashrobot -d Results -v BROWSER:firefox Tests/
robot -d Results -v BROWSER:webkit Tests/
Run in Headless Mode (No Browser Window)
Edit Resources/Variables.robot and set:
robotframework${HEADLESS} True
Run with Custom Timeout
bashrobot -d Results -v TIMEOUT:20s Tests/
Run Specific Test Case
bashrobot -d Results -t "TC01: Create Employee" Tests/PIM_Tests.robot
Run Multiple Specific Tests
bashrobot -d Results -t "TC01*" -t "TC03*" Tests/

Parallel Execution (Advanced)
Install Pabot for parallel execution:
bashpip install robotframework-pabot
Run tests in parallel:
bashpabot -d Results Tests/

📊 Test Reports
After test execution, reports are generated in the Results/ folder:
Report Files:

report.html - High-level test execution summary

Shows pass/fail statistics
Test execution timeline
Tag-based statistics

log.html - Detailed execution log

Step-by-step test execution details
Screenshots (on failure)
Error messages and stack traces

output.xml - Raw test data in XML format

Used for CI/CD integration
Can be merged with other test results

Opening Reports:
Simply double-click any HTML file to open in your browser, or:
Windows:
bashstart Results/report.html
start Results/log.html
Mac/Linux:
bashopen Results/report.html
open Results/log.html

⚙️ Configuration
Application Settings
Edit Resources/Variables.robot to modify settings:
robotframework**_ Variables _**

# Application URL

${URL} https://opensource-demo.orangehrmlive.com/

# Login Credentials

${ADMIN_USERNAME}   Admin
${ADMIN_PASSWORD} admin123

# Browser Settings

${BROWSER}          chromium    # Options: chromium, firefox, webkit
${HEADLESS} False # Set to True for headless mode
${TIMEOUT} 10s # Default timeout for waits

Test Data Configuration
The framework uses Faker library to generate random test data. Data is cached using Singleton pattern to ensure consistency across test cases.
Test Data is Generated for:

Employee details (First Name, Middle Name, Last Name)
Vacancy information (Job Title, Number of Positions)
Candidate details (Name, Email)
User credentials (Username, Password)

To regenerate test data:
Delete test_data.json file (if exists) and run tests again.

🔧 Troubleshooting
Common Issues and Solutions

1. Browser Library Not Found
   Error: ModuleNotFoundError: No module named 'Browser'
   Solution:
   bashpip install robotframework-browser
   rfbrowser init

2. Playwright Not Installed
   Error: Playwright is not installed
   Solution:
   bashrfbrowser init

3. Test Data Issues
   Error: Test data not consistent across tests
   Solution:

Ensure random_variables.py uses the Singleton pattern correctly
Delete test_data.json and run tests again

4. Timeout Issues
   Error: TimeoutError: Timeout 10s exceeded
   Solution:

Increase timeout in Variables.robot:

robotframework${TIMEOUT} 20s
Or run with custom timeout:
bashrobot -d Results -v TIMEOUT:20s Tests/

5. Element Not Found
   Error: Error: locator.click: Target closed
   Solution:

Check if locators are correct in Page files
Ensure proper wait conditions are used
Verify application URL is accessible

6. Login Failures
   Error: Cannot login to application
   Solution:

Verify credentials in Variables.robot
Check if OrangeHRM demo site is accessible
Clear browser cache or use incognito mode

🎯 Best Practices
When Writing Tests:

Always use Page Object Model

Keep locators in Page files
Keep test logic in Test files

Use Meaningful Names

Clear test case names
Descriptive variable names
Readable keyword names

Add Proper Documentation

robotframework [Documentation] Brief description of what test does

Use Appropriate Tags

robotframework [Tags] smoke regression

Handle Waits Properly

Use explicit waits instead of Sleep
Use Wait For Elements State for better reliability

Add Assertions

Verify expected results explicitly
Don't rely on absence of errors

Code Maintenance:

Keep Tests Independent

Each test should run standalone
Don't depend on other tests' data

Use Test Setup/Teardown

Initialize browser in Suite Setup
Clean up in Suite Teardown

Avoid Hardcoded Values

Use variables for test data
Use Faker for dynamic data

Review Locators Regularly

Application changes may break locators
Use stable locators (ID > Name > XPath)

📈 Continuous Integration
Example: GitHub Actions
Create .github/workflows/test.yml:
yamlname: OrangeHRM Tests

on: [push, pull_request]

jobs:
test:
runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2

    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: '3.9'

    - name: Install dependencies
      run: |
        pip install robotframework
        pip install robotframework-browser
        pip install faker
        rfbrowser init

    - name: Run Tests
      run: robot -d Results Tests/

    - name: Upload Results
      uses: actions/upload-artifact@v2
      if: always()
      with:
        name: test-results
        path: Results/

🤝 Contributing
Contributions are welcome! Please follow these guidelines:

Fork the repository
Create a feature branch (git checkout -b feature/AmazingFeature)
Commit your changes (git commit -m 'Add some AmazingFeature')
Push to the branch (git push origin feature/AmazingFeature)
Open a Pull Request

📝 Important Notes
Default Credentials

Application URL: https://opensource-demo.orangehrmlive.com/
Username: Admin
Password: admin123

Browser Support

✅ Chromium (Default - Recommended)
✅ Firefox
✅ WebKit (Safari engine)

Test Data

All test data is generated dynamically using Faker
Data remains consistent within a test run
New data is generated for each fresh test run

📞 Support
For issues, questions, or contributions:

Create an issue in the GitHub repository
Contact the test automation team
Review the troubleshooting section above

📄 License
This project is created for educational and testing purposes.

🎓 Resources

Robot Framework Documentation
Browser Library Documentation
OrangeHRM Demo Site
Faker Documentation

✅ Quick Reference Card
Installation Commands
bashpip install robotframework robotframework-browser faker
rfbrowser init
Most Used Commands
bash# Run all tests
robot -d Results Tests/

# Run smoke tests only

robot -d Results -i smoke Tests/

# Run regression tests only

robot -d Results -i regression Tests/

# Run specific test file

robot -d Results Tests/PIM_Tests.robot

# Run with different browser

robot -d Results -v BROWSER:firefox Tests/

```

### Report Files Location
```

Results/
├── report.html (Open this for summary)
├── log.html (Open this for details)
└── output.xml (For CI/CD)
