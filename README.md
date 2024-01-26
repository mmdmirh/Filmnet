
# Filmnet Test Suite

This repository contains automated tests for the website "www.filmnet.ir" using Robot Framework with the SeleniumLibrary.

## Description

The tests are designed to automate the browser interactions on the Filmnet website, including various user login scenarios.

## Dependencies

- Robot Framework: The core framework for automated testing
- SeleniumLibrary: A Robot Framework library for web-based application testing
- WebDriver: The WebDriver implementation for the browser you want to automate

## Installation

To run these tests, you must have Robot Framework and SeleniumLibrary installed. You can install them using pip:

```
pip install robotframework
pip install robotframework-seleniumlibrary
```

Additionally, you need to install the WebDriver for the browser you are testing with. For Chrome, you can install ChromeDriver. Make sure that the WebDriver is in the PATH.

## Running the Tests

To run the tests, navigate to the directory containing your test files and run:

```
robot filmnet.robot
```

Replace `filmnet.robot` with the name of your Robot Framework test file.

## Test Cases

The test suite includes the following test cases:

- Correct Password Login: Test login with the correct MSISDN and password.
- Wrong Password Login: Test the login error message with a wrong password.
- Correct OTP Login: Test login with the correct MSISDN and OTP.
- Wrong OTP Login: Test the login error message with a wrong OTP.
- More than 3 times attempt OTP Login: Test the error message for too many OTP attempts.

## Structure

The test suite is structured into three main sections:

- Settings: Includes the documentation, library imports, and test setup configurations.
- Variables: Defines the variables used across the test cases.
- Keywords: User-defined keywords to abstract and reuse sequences of actions.
- Test Cases: Defines the actual test cases to be executed.

## Teardown

The teardown step to close the browser is commented out. You can uncomment the `[Teardown]` line in the test cases to close the browser automatically after each test.

## requirements.txt

For convenience, a `requirements.txt` file can be used to install the necessary Python packages. Here is an example:

```
robotframework==3.2.2
robotframework-seleniumlibrary==5.1.3
```

Replace the version numbers with the versions you wish to use.

