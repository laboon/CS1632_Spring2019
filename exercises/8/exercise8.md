# Exercise 8

_“Cyberspace. A consensual hallucination experienced daily by billions of legitimate operators, in every nation, by children being taught mathematical concepts... A graphic representation of data abstracted from banks of every computer in the human system. Unthinkable complexity. Lines of light ranged in the nonspace of the mind, clusters and constellations of data. Like city lights, receding...”_

― William Gibson, _Neuromancer_

Put on your mirrorshades, console cowboy.  You're about to punch deck and crack through the blackest ice in cyberspace.

All you have to do is enter the password and untold riches (or at least some extra credit) are yours.

You may work with a partner or by yourself (but if you work with a partner, you split the extra credit).

This is an in-class exercise.  I will post the link here (along with the correct answer for each class) AFTER all of the classes have finished.

## Instructions

Point your Ono-Sendai Cyberspace 7 console (or web browser) to the site given to you by the instructor.

Enter the password.

How do you figure it out?  That's up to you.

## Hints

1. The password is an actual English word, although it may or may not be a common one.
2. That's it.

# GRADING

If you are the FIRST group to come up with the password and demonstrate it to me by the END OF CLASS, you will get 1.0 point of extra credit for the course (if you are working with a partner, you each get +0.5).  In other words, if you have an 89.0 in the class, and you are the first person to enter the password, your final grade would be 90.0 (89.0 + 1).

If you are NOT the first group but still come up with the password, your group gets +0.4 extra credit (if you are working with a partner, you each get +0.2).

----

## SOLUTION

The site is at `https://serene-earth-94596.herokuapp.com`

View HTML and you will see a hint at `/tunisia`

Go to `/tunisia` and try to read past the end of the buffer (the buffer is the first several paragraphs of Moby Dick).  This will tell you that there was an error and to see /laboonlogs.

`/laboonlogs` shows what is happening to the server, including everybody's guesses and how many characters they got right and the Levenshtein distance to the password.

If you get _too_ close (either in same characters or Levenshtein distance, the guesses are censored.  However, if you know your IP address, you can still keep track of your guesses.

After that, it's calculating out the characters and thinking of words that have them.  An online Scrabble word generator can be helpful for this.

All of the passwords are from famous Moby Dick quotes:

1. **Wed 11:00** - "cannibal" - _"Better sleep with a sober cannibal than a drunken Christian."_
2. **Wed 1:00** - "bridegroom" - _"For though I tried to move his arm - unlock his bridegroom clasp - yet, sleeping as he was, he still hugged me tightly, as though naught but death should part us twain."
3. **Thu 9:30** - "commodores" - _"Delight is to him — a far, far upward, and inward delight — who against the proud gods and commodores of this earth, ever stands forth his own inexorable self."_

### Limitations

If you try to enter more than one guess per second for five seconds, your IP is blacklisted for 20 econds.

If you tried to enter the password from one of the earlier classes, your IP would be blacklisted from guessing for 60 seconds.

I sanitized input (stripping out HTML-only characters) after the 1:00 class messed with the logs.

I limited the size of the input param to 40 characters after the 1:00 class messed with the logs.