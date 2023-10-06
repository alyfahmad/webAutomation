*** Settings ***
# Keyword Resource Files
Resource    ../PageObjects/KeywordDefinitionFiles/Common.robot
Resource    ../PageObjects/KeywordDefinitionFiles/HomePage.robot
Resource    ../PageObjects/KeywordDefinitionFiles/CartPage.robot
Resource    ../PageObjects/KeywordDefinitionFiles/LoginPage.robot
Resource    ../PageObjects/KeywordDefinitionFiles/SignupPage.robot
Resource    ../PageObjects/KeywordDefinitionFiles/CheckoutPage.robot
Resource    ../PageObjects/KeywordDefinitionFiles/PaymentPage.robot

# Test Data Imports
Variables    ../PageObjects/TestData/CommonTestData.py
Variables    ../PageObjects/TestData/HomePageTestData.py
Variables    ../PageObjects/TestData/CartPageTestData.py
Variables    ../PageObjects/TestData/SignupPageTestData.py
Variables    ../PageObjects/TestData/CheckoutPageTestData.py
Variables    ../PageObjects/TestData/PaymentPageTestData.py

# Step 1: Launch browser(Chrome/Firefox) & Step 2: Navigate to url 'http://automationexercise.com'
Suite Setup     Open Browser, Navigate to Specified Url and Maximize Window     ${PreferredBrowser}     ${HomePageUrl}
Suite Teardown      Close Browser

*** Variables ***
${Current_Date}

*** Test Cases ***
TC01 Homepage Verifications
    # Step 3: Verify that home page is visible successfully
    Verify Page Title       ${HomePageTitle}
    # Step 4: Add products to cart
    Add Item to Cart Based on Item Name     ${BlueTopItemName}
    Click Button Based On Button Text   ${ContinueShoppingButton}
    Add Item to Cart Based on Item Name     ${FancyGreenTopItemName}
    # Step 5:  Click 'Cart' button
    Click on Link Based on Text     ${ViewCartLink}

TC02 CartPage Verifications
    # Step 6: Verify that cart page is displayed
    Verify Page Title       ${CartPageTitle}
    Verify Cart Items
    # Step 7: Click Proceed To Checkout
    Click Button Based On Button Text   ${CheckoutButton}     ${True}
    # Step 8: Click 'Register / Login' button
    Click on Link Based on Text     ${RegisterLink}

TC03 LoginPage & SignupPage Verifications
    # Step 9:  Fill all details in Sign up and create account
    Input Text into Signup Form Based on Placeholder    ${NamePlaceholder}    ${Name}
    ${Current_Date}=    Get Current Date    result_format=%d-%m-%Y-%H-%M
    Input Text into Signup Form Based on Placeholder    ${EmailPlaceholder}    test${Current_Date}@tester.com
    Click Button Based On Button Text    ${SignupButton}
    Add Data to Signup Form
    Scroll Subscription Into View
    Click Button Based On Button Text    ${CreateButton}
    # Step 10: Verify 'ACCOUNT CREATED!' and click 'Continue' button
    Verify Account Created Successfully
    Click Button Based On Button Text    ${ContinueButton}  ${True}

TC04 HomePage Verifications Part 2
    # Step 11: Verify ' Logged in as username' at top
    Verify Logged in Username   ${Name}
    # Step 12: Click 'Cart' button
    Click Button Based On Button Text   ${CartButton}    ${True}

TC05 CartPage Verifications Part 2
    # Step 13: Click 'Proceed To Checkout' button
    Click Button Based On Button Text   ${CheckoutButton}     ${True}

TC06 Checkout Verification
    # Step 14: Verify Address Details and Review Your Order
    Verify Delivery Address Fields
    Verify Billing Address Fields
    Verify Cart Items
    Scroll Subscription Into View
    # Step 15: Enter description in comment text area and click 'Place Order'
    Click Button Based On Button Text   ${PlaceOrderButton}     ${True}

TC07 Payment Verification
    # Step 16:  Enter payment details: Name on Card, Card Number, CVC, Expiration date
    Add Data to Payment Form
    # Step 17: Click 'Pay and Confirm Order' button
    Click Button Based On Button Text   ${PaymentButton}
    # Step 18: Verify the success message 'Your order has been placed successfully!'
    Verify Successful Payment

*** Keywords ***
Add Data to Signup Form
    Input Text into Form Based on Label    ${PasswordLabel}    ${Password}
    Input Text into Form Based on Label    ${FNameLabel}    ${FName}
    Input Text into Form Based on Label    ${LNameLabel}    ${LName}
    Input Text into Form Based on Label    ${AddressLabel}    ${Address}
    Input Text into Form Based on Label    ${StateLabel}    ${State}
    Input Text into Form Based on Label    ${CityLabel}    ${City}
    Input Text into Form Based on Label    ${ZipLabel}    ${Zip}
    Input Text into Form Based on Label    ${MobileLabel}    ${Mobile}

Verify Delivery Address Fields
    Verify Delivery Address     ${Address}
    Verify Delivery Address     ${City} ${State} ${Zip}
    Verify Delivery Address     ${Country}
    Verify Delivery Address     ${Mobile}

Verify Billing Address Fields
    Verify Billing Address     ${Address}
    Verify Billing Address     ${City} ${State} ${Zip}
    Verify Billing Address     ${Country}
    Verify Billing Address     ${Mobile}

Verify Cart Items
    Verify Item in Cart by Item Name    ${BlueTopItemName}
    Verify Item in Cart by Item Name    ${FancyGreenTopItemName}

Add Data to Payment Form
    Input Text into Form Based on Label    ${NameOnCardLabel}    ${NameOnCard}
    Input Text into Form Based on Label    ${CardNumberLabel}    ${CardNumber}
    Input Text into Form Based on Label    ${CVCLabel}    ${CVC}
    Input Text into Form Based on Label    ${ExpirationMonthLabel}    ${ExpiryMonth}
    Input Current Year into Year Field


