# HaggleX

Haggle X mobile app created for the HaggleX technical interview.

# Requirements
- iOS ~> 15
- Xcode ~> 13 (9.3 compatible)
- Swift ~> 5.0

# Installation
Clone the repository
```sh
$ git clone https://github.com/omokagbo/HaggleX.git
$ cd HaggleX
$ pod install
```

Open the file `HaggleX.xcworkspace` using Xcode 
Allow the project to build and install all dependencies.
Click on the play button at the top left corner to build and run the project

### SPLASH SCREEN

<img width="290" alt="Splashscreen" src="https://user-images.githubusercontent.com/69020285/138555870-c973a3b2-96af-42d6-9d28-a3acdd7b4f65.png">  


### LOGIN

From the splash screen, the user is taken to the Login screen and for a new user without account, there is a Create Account button on the screen that takes them to where they can create a new account. There is an email and a password field where user enters their details and these fields are validated.

<img width="278" alt="Login screen" src="https://user-images.githubusercontent.com/69020285/138555920-7468b75f-0506-4f9c-aa45-b7d9ec2c709f.png">


### CREATE ACCOUNT

On clicking on the Create Account button, the user is taken to the "Create New Account" screen where the user gets to create a new account with email, password, username, phone number and referral code. Just like the login screen, these fields are all validated to make sure:
- The email address is valid and has not been used
- Password is more than 8 characters
- A username that is not already in use
- Phone number that is not already in use and is valid
- An optional referral code to check if it is valid

When user clicks on the Sign up button, a verification code is sent to the email provided and the user is taken to a screen where they get to verify their account.

<img width="275" alt="Create account screen" src="https://user-images.githubusercontent.com/69020285/138556081-bb5b01bf-7444-4b61-8daf-295fa4c93719.png">

Here the user also gets to select the country and country code for phone number verification:

<img width="275" alt="Create account screen" src="https://user-images.githubusercontent.com/69020285/138556470-311ae2cc-7baa-4092-9795-205e38e0b74b.png">


### VERIFY ACCOUNT
Here, the user gets to enter the code sent to their email address and if it's valid, they get to move to the next screen. The code is only valid for 10 minutes. If it expires, the user can get to ask for a new code to be resent using the resend verification code button.

<img width="282" alt="Verify account screen" src="https://user-images.githubusercontent.com/69020285/138556212-ea62280d-8fed-4f49-8463-48433dc189b7.png">


### SETUP COMPLETE
On successful completion of account verification, the user is taken to a success splash screen from where they are taken to the home screen.

<img width="280" alt="Setup complete" src="https://user-images.githubusercontent.com/69020285/138556291-46c5b648-e295-456c-987e-64f35b23927b.png"> 


### DASHBOARD
The user is presented with the dashboard. Here the user can get to switch currencies between naira and dollar. The user is also able to logout, get news about crypto and a whole lot of other features

<img width="280" alt="Dashboard" src="https://user-images.githubusercontent.com/69020285/138556584-d4f235a9-750d-432c-936c-2972c5bab41f.png"> 


# DEMO

https://user-images.githubusercontent.com/69020285/138558798-23c3217f-f9e3-4085-8191-2570c16d021e.mp4



