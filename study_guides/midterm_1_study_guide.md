# CS 1632 Midterm 1 Exam Study Guide - Spring 2019

The midterm is on the last day of classes before Spring Break (6 MAR for students in M/W classes; 7 MAR for students in the T/H class).  You will have the entire class period to complete it.


The midterm will cover everything we have covered up to the last class in February (either 27 FEB or 28 FEB).  It will NOT cover the automated systems testing lecture on 4 MAR or 5 MAR.  I recommend you review the slides and the textbook (see syllabus.md for reminders of which chapters were required reading).

Here are the key topics to study in preparation for the test.

## TESTING THEORY AND TERMINOLOGY
* Equivalence class partitioning
* Boundary and interior values
* Base, Edge, and Corner cases
* Static vs Dynamic testing
  * Know the differences and examples of each
* Black/White/Grey box testing
  * Know the differences and examples of each

## REQUIREMENTS ANALYSIS
* What makes a good or bad requirement?
* Testability - requirements must be:
  * Complete, consistent, unambiguous, quantitative, feasible
* Functional vs Non-Functional Requirements  (Quality Attributes)
  * Be able to define and write your own
* Traceability Matrices
  * Be able to define and write your own

## TEST PLANS
* Given a list of requirements, be able to write a test plan
* Terminology: test cases, test plans, test suites, test runs
* Verification vs validation

## DEFECT REPORTING
* Be prepared to report a defect based on a test case
* Remember the defect template:
  * SUMMARY, DESCRIPTION, REPRODUCTION STEPS, EXPECTED BEHAVIOR, OBSERVED BEHAVIOR
  * Optionally: SEVERITY/IMPACT, NOTES
  * Levels of severity: BLOCKER, CRITICAL, MAJOR, NORMAL, MINOR, TRIVIAL
* Coding mistakes vs defects

## Smoke, Exploratory, and Path-based testing
* Define all of these concepts
* I will not ask you to calculate cyclomatic complexity for a given method but I expect you to understand the concept and explain why a method with a higher or lower complexity might be easier/harder to test and why

## AUTOMATED TESTING
* Pros and cons of automated testing
* Unit tests vs system tests

## UNIT TESTING
* Unit tests
  * Pay special attention to assertions
  * Understand how to write a Minitest unit test (basic syntax)
* Given some Ruby code, be able to perform an equivalence class partitioning and write tests for it

## BREAKING SOFTWARE
* Be prepared to think of happy path vs edge case testing
* What are various ways that software can break?

## STATIC ANALYSIS
* Understand static vs dynamic testing
* Understand limitations of static testing
* Know different kinds of static analysis, and tools and methods used (e.g. linters, bug finders, code coverage, code metrics, code reviews)
* You do NOT need to know specific Rubocop/Reek errors, but should understand what Rubocop and Reek do and what they might catch or not
* Understand code coverage and be able to calculate
* Understand difference between statement and method coverage

## TDD
* Basic concepts of test-first development
* The red-green-refactor loop
* Benefits and drawbacks of TDD
  * When to use it?
  * When not to use it?

## WRITING TESTABLE CODE
* What do we mean by "testable code"?
* Basic strategies for testable code
* Code segmentation
* "Give yourself something to test"
* Pure vs impure methods - be prepared to define and/or determine if a method is pure or not
* The DRY Principle - how could you DRY up some code?
* Understand seams - be able to re-write a method to have a seam.
* Dependency injection - what is it?  Be able to re-write a method to use dependency injection.
