# CS 1632 - Software Quality Assurance

## Exercise 5

For this assignment, you and a partner will update the "guessing game" in `/sample_code/sinatra_example` and add systems-level, automated black-box tests using Katalon Automation Recorder.  Your tests should focus on the functionality you will add (below).

I recommend you do a minimum of six tests, checking various base, edge, and corner cases.  However, do not focus on the number of tests too heavily; I am more concerned that you cover a broad variety of cases, and ones which are focused and still likely to find defects.

I also recommend that you write the code for the test mode first, as it will make your other testing much easier.  Then write the Katalon tests for the test mode.  Then you can work on the code for the second requirement, then finally the Katalon tests for the second requirement.

## Functionality to Add

1. Add a "test" mode.  If a param called "test" with any integer value is passed in, the secret number should be set to whatever the test value is.  If the test parameter cannot be interpreted as an integer or is an invalid integer (i.e., one greater than 100 or less than 1), the secret number should be set to 50.
2. If the user is within 5, inform the user that they are close (e.g., if the secret number is 10 - 11, 12, 13, 14, or 15, or 5, 6, 7, 8, or 9, would all show the message, other numbers would not) with the message "You're really close!", unless they have the number exactly right.  Otherwise display nothing (except the original message of whether they are too high or too low).  For example, assuming the secret number is 50, and their guess is:

* 50 - That's exactly right!
  * _There is no need to say that they are close if it is exact._
* 75 - That's too high!
  * _It is too high, but it is not close._
* 52 - That's too high!  You're really close!
  * _It is too high, but it is within five of the correct answer._
* 25 - That's too low!
  * _It is too low, but it is not close._
* 48 - That's too low!  You're really close!
  * _It is too low, but it is within five of the correct answer._

## Tips

1. I recommend you get the test mode functionality working correctly first.  This will allow you to write and test the "You're really close" feature more easily.
2. For the "You're really close" feature, you can add this functionality to the same message generator function (to pass in different methods) or create a separate close/not close variable to pass in to the ERB file.  Either will work.

## Grading

This is an exercise and thus not graded.  Please feel free to speak to or email me to discuss any problems that you have.
