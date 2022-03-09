*** Settings ***
Variables   ../Variables/Locators.py
Library     AppiumLibrary
Library     Collections
Library     JSONLibrary
Library     Collections

*** Variables ***
${ANDROID_AUTOMATION_HOST}    http://localhost:4723/wd/hub
${ANDROID_PACKAGE_NAME}       com.mobiquity.kib.onboarding.devMob
${ANDROID_ACTIVITY_NAME}      com.mobiquity.kib.onboarding.MainActivity
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   11
${ANDROID_DEVICE_NAME}        emulator-5554


*** Keywords ***
Open Test Application
  Open Application   ${ANDROID_AUTOMATION_HOST}    platformName=${ANDROID_PLATFORM_NAME}    platformVersion=${ANDROID_PLATFORM_VERSION}     deviceName=${ANDROID_DEVICE_NAME}   app=/Users/mbhatiya/Desktop/RobotFramework/app.apk    appPackage=${ANDROID_PACKAGE_NAME}  appActivity=${ANDROID_ACTIVITY_NAME}

Navigate to the Onbaording Screen
  start screen recording
  click button     No, I want to open an account


Verify the Eligibility Text
  element text should be       ${Checkbox}       Yes, all statements above are true
  click element     ${Checkbox}
  click button      Continue

Verify the Information Icon Details
  element should contain text   id=termsConditionsText     Terms
  click button      I agree

Navigate to Phone Number Screen
  click button      Get started
  wait until element is visible     ${InputTextField}

Enter the Phone Number
  [Arguments]     ${phonenumber}
  input text        ${InputTextField}     ${phonenumber}

Verify the Continue Button
  element should be enabled     ${ContinueBtn}
  click button      Continue
  stop screen recording

Close Test Application
    close application





