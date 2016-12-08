Alex Mai (amai2@u.rochester.edu)

1. Same as proposal from Project 1 - included again for reference.

2. I affirm that I did not give or receive any unauthorized help on this project, and that all work is my own.

3. 
(a) Implemented a DatePicker - When you press “+Add Plan” from the root view controller after the navigation controller, you will be presented a form that requests a trip. In there, I implement a DatePicker where the user can choose their dates of departure and return. This is much better than having the user type it in (which can be an invalid date). The benefits of implementing this is that it conforms to one standard way of presenting dates and can be used to compare to other dates in the future. It also has a minimum date set to the present date.

(b) Extensions - I created an extension for UIButton for my register view. This was to help the user interface design to be more user friendly.

(c) Form logic - In particular, I need the user to conform to the input standards. The primary reason for that is I included a few photos of places, and it only picks up certain locations that are properly typed in (ex. “Los Angeles, CA”, “Toronto, Ontario”, etc.). If the user inputs one of the hard-coded cities, then in the plans, it will show up and have a photo of that location. Otherwise, it’s a photo of a cruise ship. I’m looking into using Google Images to place it as the first image returned from a search result.

(d) Automatic login - I commented this out but if you would like to try it out, it’s line 88-90 in “ViewController.swift”. Basically, if the application went into a background state while you entered your correct credentials, the next time you log in will automatically process that input.

4. Instructions:
Launch the app and click on the buttons as you wish. If you want to log into an already generated account(I did for test purposes), here are the credentials:

Login: admin
Password: password

or

Login: hillary
Password: clinton

Otherwise, if you want to register for an account, you may do so. After you register, you can immediately use those credentials to log in.

After logging in, you will be presented a a view controller that’s embedded in navigation controller. If you have active trip plans, then you may select it on the table view and it will present more details about the trip. Otherwise, there are two bar buttons on the top. The one on the left shows you more information about yourself, that you entered from the registration form. The right button shows you a form to request a trip. Once you complete the form, you can go back and you will see that it has been added as an active trip. However, upon tapping to get more information about the trip, you will notice that the status of the trip is “pending”, instead of “active”.

5. Attachments
proposal.pdf - for reference
SampleOutput - images of the functioning application.

Note:
There are a few things that are intentionally designed that may seem like an error.
- Persistence of account and of a trip plan request after it has been created: I intentionally did not “persist” these because I don’t think it is the safest design to give the user my dictionary of all the accounts (Imagine if you had access to everyone’s Facebook/Twitter account credentials just because you registered for an account!). My hopes is to store them in tables on a database and join them when needed. But we have yet to learn that yet.