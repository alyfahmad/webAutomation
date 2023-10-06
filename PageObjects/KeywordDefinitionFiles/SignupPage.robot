*** Settings ***
Library    SeleniumLibrary
Variables    ../StaticLocators/SignupPageLocators.py

*** Keywords ***
Verify Account Created Successfully
    Wait Until Page Contains Element    ${AccountCreatedLocator}
    Element Should Be Visible    ${AccountCreatedLocator}