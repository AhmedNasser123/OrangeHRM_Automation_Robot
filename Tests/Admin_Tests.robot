*** Settings ***
Library           Browser   
Resource          ../Resources/Variables.robot
Resource          ../Pages/LoginPage.robot
Resource          ../Pages/PIMPage.robot
Resource          ../Pages/AdminPage.robot
Variables         ../Resources/random_variables.py

Suite Setup       Setup Admin Tests
Suite Teardown    Close Orange HRM Application

   


*** Keywords ***
Setup Admin Tests
    Open Orange HRM Application    
    Login To Application    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}

*** Test Cases ***
TC05: Create System User and Login
    [Tags]    smoke
    [Documentation]    Create a new system user and verify login with new credentials
    # Create Employee
    Navigate To PIM Module
    Click Add Employee
   ${FULL_NAME}=  Create New Employee   
   ...  ${EMPLOYEE_FIRST_NAME}
   ...  ${EMPLOYEE_MIDDLE_NAME}
   ...  ${EMPLOYEE_LAST_NAME}  
     
    
    # Create User
    Navigate To Admin Module
    Click Add User     
    ${USERNAME}=    Set Variable    ${NEW_USER_USERNAME}  
    ${PASSWORD}=    Set Variable    ${NEW_USER_PASSWORD}                      
    Create New System User    ${FULL_NAME}    ${USERNAME}    ${PASSWORD}
    Verify User In Search Results    ${USERNAME}
 
    # Logout
    Logout From Application
    # Login with New User
    Login To Application    ${USERNAME}    ${PASSWORD}
    Verify Login Success