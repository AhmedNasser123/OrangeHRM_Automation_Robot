*** Settings ***
Library           Browser
Resource          ../Resources/Variables.robot
Resource          ../Pages/LoginPage.robot
Resource          ../Pages/PIMPage.robot
Variables         ../Resources/random_variables.py

Suite Setup       Setup PIM Tests
Suite Teardown    Close Orange HRM Application

*** Keywords ***
Setup PIM Tests
    Open Orange HRM Application    
    Login To Application    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}

*** Test Cases ***
TC01: Create Employee
    [Tags]    smoke  regression
    [Documentation]    Create a new employee in PIM module and verify success
    Navigate To PIM Module
    Click Add Employee
   Create New Employee    ${EMPLOYEE_FIRST_NAME}    ${EMPLOYEE_MIDDLE_NAME}    ${EMPLOYEE_LAST_NAME}
    

TC02: Search Employee
    [Tags]    regression
    [Documentation]    Search for the created employee and verify data
    Navigate To PIM Module
    Navigate To Employee List
    Search For Employee    ${EMPLOYEE_FIRST_NAME}
    Verify Employee In Search Results    ${EMPLOYEE_FIRST_NAME}    ${EMPLOYEE_LAST_NAME}