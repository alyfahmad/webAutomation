*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Input Text into Signup Form Based on Placeholder
    [Arguments]     ${Placeholder}      ${Input_Text}
    Wait Until Element Is Visible   xpath://h2[text()='New User Signup!']/parent::div//input[normalize-space(translate(@placeholder,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Placeholder}']   timeout=10
    Input Text      xpath://h2[text()='New User Signup!']/parent::div//input[normalize-space(translate(@placeholder,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Placeholder}']       ${Input_text}
