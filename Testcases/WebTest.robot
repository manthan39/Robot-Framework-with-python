*** Settings ***
Resource   ../Resources/Webresource.robot
Test Setup     Open Test Application
Test Teardown  Close Test Application


*** Test Cases ***
Simple Smoke Test
       [Tags]      Smoke
       Navigate to the Onbaording Screen
       Verify the Eligibility Text
       Verify the Information Icon Details
       Navigate to Phone Number Screen
       Enter the Phone Number   98756743
       Verify the Continue Button

Simple Sanity Test
       [Tags]      Sanity
       Navigate to the Onbaording Screen
       Verify the Eligibility Text
       Verify the Information Icon Details
       Navigate to Phone Number Screen
       Enter the Phone Number   1234567
       Verify the Continue Button









