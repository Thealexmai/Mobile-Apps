Alex Mai (amai2@u.rochester.edu)

1. Please see proposal.pdf attached for my project proposal.

2. I affirm that I did not give or receive any unauthorized help on this project, and that all work is my own.

3. 
(a) Handling injections - I don’t allow the user to type in characters that can potentially be used to authenticate him or herself as someone else. For example, in the login, I use a delegate to reject the user from typing in “/“ just in case it can comment out the field. In the registration, I check for empty strings, illegal characters, and more - test this out by pressing the “Register” button without typing anything in the fields, or typing “/“ into a field and then press the Register button, or type in “admin” as your desired login and then Register with it. They should all show you a popup with a customized error.
(b) UIImageView - I used an image view to display a profile picture and a launch screen picture.
(c) AlertController - I use an alert system to warn the user of any errors in the registration form. For example if the user wants to register an account with an already existing login, then an alert will popup on the screen.
(d) Segue - I use segues to transition from one View Controller to the next.
(e) Translated all the strings to French. To see it happen, close the app, open settings and configure language to french, and then relaunch the application.
(f) Supports dynamic type - you can resize the text in your general settings and the app will change the size of its fonts.

4. Instructions:
Launch the app and click on the buttons as you wish. If you want to log into an already generated account(I did for test purposes), here are the credentials:

Login: admin
Password: password

or

Login: hillary
Password: clinton

Otherwise, if you want to register for an account, you may do so. After you register, you can immediately use those credentials to log in.

5. Attachments
proposal.pdf - for the proposal requirement of the project
SampleOutput - images of the functioning application.