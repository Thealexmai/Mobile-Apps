Alex Mai (amai2@u.rochester.edu)

1. Please see proposal.pdf attached for my project proposal.

2. I affirm that I did not give or receive any unauthorized help on this project, and that all work is my own.

3. 
(a) UIImageView - I used an image view to display a profile picture and a launch screen picture.
(b) AlertController - I use an alert system to warn the user of any errors in the registration form. For example if the user wants to register an account with an already existing login, then an alert will popup on the screen.
(c) Segue - I use segues to transition from one View Controller to the next.
Handling injections - I don’t allow the user to type in characters that can potentially be used to authenticate him or herself as someone else. For example, in the login, I use a delegate to reject the user from typing in “/“ just in case it can comment out the field. In the registration, I check for empty strings, illegal characters, and more.