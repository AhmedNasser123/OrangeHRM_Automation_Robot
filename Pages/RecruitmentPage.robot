*** Settings ***
Library           Browser

*** Variables ***
# Recruitment Module Locators
${MENU_RECRUITMENT}         xpath=//span[text()='Recruitment']
${MENU_VACANCIES}           xpath=//a[text()='Vacancies']
${BTN_ADD_VACANCY}          xpath=//button[normalize-space()='Add']
${INPUT_VACANCY_NAME}       xpath=//label[text()='Vacancy Name']/parent::div/following-sibling::div/input
${INPUT_JOB_TITLE}          xpath=//label[text()='Job Title']/parent::div/following-sibling::div//div[@class='oxd-select-text-input']
${INPUT_HIRING_MANAGER}     xpath=//label[text()='Hiring Manager']/parent::div/following-sibling::div//input
${INPUT_NO_OF_POSITIONS}    xpath=//label[text()='Number of Positions']/parent::div/following-sibling::div/input
${BTN_SAVE_VACANCY}         xpath=//button[@type='submit']


# Candidates Locators
${MENU_CANDIDATES}          xpath=//a[text()='Candidates']
${BTN_ADD_CANDIDATE}        xpath=//button[normalize-space()='Add']
${INPUT_FIRST_NAME_CAND}    xpath=//input[@name='firstName']
${INPUT_MIDDLE_NAME_CAND}   xpath=//input[@name='middleName']
${INPUT_LAST_NAME_CAND}     xpath=//input[@name='lastName']
${INPUT_EMAIL_CAND}         xpath=//label[text()='Email']/parent::div/following-sibling::div/input
${INPUT_VACANCY_CAND}       xpath=//label[text()='Vacancy']/parent::div/following-sibling::div//div[@class='oxd-select-text-input']
${BTN_SAVE_CANDIDATE}       xpath=//button[@type='submit']

*** Keywords ***
Navigate To Recruitment Module
    Click    ${MENU_RECRUITMENT}
    Wait For Elements State    ${MENU_VACANCIES}    visible    timeout=10s

Navigate To Vacancies
    Click    ${MENU_VACANCIES}
    Wait For Elements State    ${BTN_ADD_VACANCY}    visible    timeout=10s

Click Add Vacancy
    Click    ${BTN_ADD_VACANCY}
    Wait For Elements State    ${INPUT_VACANCY_NAME}    visible    timeout=10s

Create New Vacancy
    [Arguments]    ${vacancy_name}    ${num_positions}
    Fill Text    ${INPUT_VACANCY_NAME}    ${vacancy_name}
    
    # Select Job Title (First Option)
    Click    ${INPUT_JOB_TITLE}
    Sleep    1s
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter
    
    # Fill Number of Positions
    Fill Text    ${INPUT_NO_OF_POSITIONS}    ${num_positions}
    
    # Fill Hiring Manager
    Fill Text    ${INPUT_HIRING_MANAGER}    a
    Sleep    2s
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter
    
    Click    ${BTN_SAVE_VACANCY}
   


Navigate To Candidates
    Click    ${MENU_CANDIDATES}
    Wait For Elements State    ${BTN_ADD_CANDIDATE}    visible    timeout=10s

Click Add Candidate
    Click    ${BTN_ADD_CANDIDATE}
    Wait For Elements State    ${INPUT_FIRST_NAME_CAND}    visible    timeout=10s

Add New Candidate
    [Arguments]    ${first_name}    ${middle_name}    ${last_name}    ${email}
    Fill Text    ${INPUT_FIRST_NAME_CAND}    ${first_name}
    Fill Text    ${INPUT_MIDDLE_NAME_CAND}    ${middle_name}
    Fill Text    ${INPUT_LAST_NAME_CAND}    ${last_name}
    Fill Text    ${INPUT_EMAIL_CAND}    ${email}
    
    # Select Vacancy (First Option)
    Click    ${INPUT_VACANCY_CAND}
    Sleep    1s
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter
    
    # Scroll to Save Button and Click
    Scroll To Element    ${BTN_SAVE_CANDIDATE}
    Click    ${BTN_SAVE_CANDIDATE}
   