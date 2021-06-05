# Fuse Minimal Wallet
<img src="assets/images/fuse.png" width="200">
Hello,
This is my Fuse minimal wallet for FUSE.IO

First of all, thank you very much for the opportunity.

## How to use
1. Download this repository to your Android studio or VSCode.
2. Run the app on the emulator or your local device.
3. Enjoy the app.

## Open Questions
**First Question**: How can we remove the "Add token" button?

A: We will create an API call that will bring all the existing tokens and check what is in our account if we have a balance of specific token.
if we have, we will show it otherwise we will show 0.
In each action we take in our account we will check if there was a change in one of the TOKENS and change accordingly.

**Second Question**: How can we add more accounts to the wallet? So it can work not with one accounts but with multiple accounts.

A: First, we can use the API call for Get balance for multiple addresses, to do this we can add a button that will add a text box for entering a user each time in the login window and by clicking the login button we will send the list of users to the server.
then, the design can be the same but we need to add a hamburger button that will pop with list of the users that we can switch between them.

## Extra
1. I add a short clip of the app if you want to see it in action instead of download the repository, this is in assets/video.
2. In the text box I entered in advance the information that should be to make it easier. Feel free to change it or enter it yourself in the following places:
* login_page.dart in line 28.(addressHash)
* add_toke_bottom_sheet.dart in line 47 or 48.(contractAddressHash)

*** read the comment before in each file  ***

*p.s*

The tests were with the addressHash in line 28, and the results that i got it by this addressHash.


Hope you will enjoy my app, thanks

## Made by
 Lior Trachtman