*** Settings ***
Library           Browser
Resource          ../Resources/Variables.robot
Resource          ../Pages/LoginPage.robot
Resource          ../Pages/RecruitmentPage.robot
Variables        ../Resources/random_variables.py

Suite Setup       Setup Recruitment Tests
Suite Teardown    Close Orange HRM Application



*** Keywords ***
Setup Recruitment Tests
    Open Orange HRM Application  
    Login To Application    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}

*** Test Cases ***
TC03: Create Vacancy
    [Tags]    smoke 
    [Documentation]    Create a new job vacancy in Recruitment module

    Navigate To Recruitment Module
    Navigate To Vacancies
    Click Add Vacancy
    Create New Vacancy    ${VACANCY_NAME}    ${NUM_POSITIONS}


TC04: Add Candidate
    [Tags]    regression
    [Documentation]    Add a new candidate to recruitment
    
    Navigate To Recruitment Module
    Navigate To Candidates
    Click Add Candidate
    Add New Candidate    ${EMPLOYEE_FIRST_NAME}    ${EMPLOYEE_MIDDLE_NAME}    ${EMPLOYEE_LAST_NAME}    ${CANDIDATE_EMAIL}
   