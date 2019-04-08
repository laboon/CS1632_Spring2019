# CS 1632 - Software Quality Assurance
Spring Semester 2019

DUE 15/16 APR 2019 (MW/TH class) - LATE DUE DATE 17/18 APR 2019 (MW/TH class)

## Deliverable 4

In this deliverable, you and a partner will write software to verify if a simple blockchain is valid.

Under _no_ circumstances should the program crash or should the user see an exception or stack trace directly.  You should handle all edge cases that might be thrown at you, such as a non-existent file, no arguments, different failure modes, etc.

The program shall accept one argument, which is the name of a file which should contain a valid Billcoin blockchain (see billcoin.md in this directory for the rules of Billcoin).  Your program will read in and either determine if it is valid (in which case you should print out all of the address which have billcoins and how many), or invalid (in which case you should print out what the error is).

The program shall be called `verifier.rb`.  Your repository shall be named D4.  This program must be written in Ruby and use minitest for the unit tests.  This program must use rubocop with the attached `.rubocop.yml` configuration and SimpleCov as described in class.

You should work on making this program execute as quickly as possible (i.e., minimize real execution time).  You may use all computing resources available to you.  This will be run on a four-core system with sixteen gigabytes of RAM.  No other programs will be running at the time.

You will use the flamegraph gem to determine execution "hot spots".

You will use the `time` command (or Measure-Command in Windows) to determine total execution time.

## Format
Every assignment should have a title page with:
* The name of the students in the group and their GitHub usernames
* A link to your repository
* The title "CS 1632 - DELIVERABLE 4: Performance Testing "

There is no need to print out the code BUT YOU MUST PRINT OUT AND HAND IN THE DELIVERABLE PAPERWORK.  It should be available on GitHub BY THE BEGINNING OF CLASS.

For the summary, describe how you profiled the application in approximately one page.  You should answer the following questions in your summary:

1. What was most challenging about this deliverable?
1. What kind of edge cases and failure modes did you consider?
1. Using the flame graph, what methods were taking up the most CPU time?
1. What changes did you make based on the flame graph and timing?

The summary should be approximately a page.

On a separate page, you should include two screenshots of the flame graph - one BEFORE you make your performance-enhancing change (i.e., at the INITIAL tag - see below) and one AFTER.  You should  _also_ include the generated .html file in your repository.

You may experience issues rendering very large flamegraphs on your browser, especially if you use `long.txt`.  Feel free to use the flamegraph for `sample.txt` or some other very small file if this is the case.  If you want to make an even smaller file than `sample.txt`, you can just make a copy of sample.txt and delete lines from the end.  You should still end up with a valid blockchain.

There should be at least twenty unit tests and statement coverage of at least 90%.  It is up to you if you would like to use more, use mocks/doubles/stubs or not, etc.  There just must be at least twenty valid unit tests and statement coverage of 90% or greater.

You should time the program with the `long.txt` file three times AND indicate the mean and median amount of real ("wall clock") time it took to execute.  You can do this with the `time` command in Unix-like systems (Linux, OS X, BSD) or the `Measure-Command` command in PowerShell on Windows systems.  All three of these times should be listed ALONG with the MEAN and MEDIAN time to execute the program with `long.txt` on a separate page.

I would like you to first get this to work *correctly*, and commit this to GitHub.  You must then refactor the code to improve performance in some way and commit again.

You will tag the initial (working but non-optimized) commit with the tag INITIAL.  I should then be able to do "git diff INITIAL" to see the changes that you made to refactor the program.  I should be able to run the code on BOTH commits (INITIAL and the final commit on the master branch).  However, I will only check rubocop, tests, and statement coverage on the final commit on the master branch.

You must use the flamegraph gem to determine execution "hot spots" and  the `time` command (or Measure-Command for Windows) to determine total execution time, both before and after any changes you make.  Include flamegraph screenshots and times from both the INITIAL and final commits on the repo.

You should explain how your program has been sped up in your summary.  You should see some significant speed-up in real time from your initial commit to the final commit.

The fastest program to _correctly_ execute my generated equivalent of a long blockchain will receive an automatic 110/100 for the assignment.  Any group which can obtain a time that is not more than 25% longer than the fastest assignment will receive +5 bonus points.  Any group which can obtain a time not more than 100% longer than the fastest assignment will receive +2 bonus points.  This is on a per-class basis (i.e., each class will have one team with the fastest time and thus 110/100, and bonus points for that class will be calculated based on the fastest time for that class).

Note that the blockchain files I will run on it will be similar to, but different than, the example blockchain files shown here.  These are just to give you examples of possible Billcoin blockchain files.

Detailed information about Billcoin is in the `billcoin.md` file in this directory.  There are also a variety of sample Billcoin blockchain files in the sample_blockchains subdirectory.  See `sample_output.txt` for the expected output of these files when the verifier is run against them.

## Tagging

Following Knuth's dictum that "premature optimization is the root of all evil", you should first get a working version of the Billcoin verifier before attempting to optimize it.  Once you have it working but not optimized, you should tag the commit (see below).  After this you can continue working and I will consider the final commit on the master branch before the deadline as your final, optimized version of the software.

You must tag the particular commit you want to have graded as your initial attempt with the tag `INITIAL`.  Be sure you push the tag up to GitHub specifically!  Pushing up the branch to origin will NOT automatically push up the tag as well, you must do so separately.  If you want to tag the current commit, you may do so with the following commands:

```
git tag -a INITIAL -m "INITIAL"
git push origin INITIAL
```

Further details on tagging are here: https://git-scm.com/book/en/v2/Git-Basics-Tagging

## Grading
* Summary - 10%
* Flame graphs included (before and after) - 5%
* Final times (>= 3 + mean) included, for both INITIAL and final - 5%
* Performance enhancement - 10%
* Functionality (including handling errors) - 45%
* Unit Tests (including statement coverage) - 25%
* -2 for each Rubocop error past three, up to -10 points off
