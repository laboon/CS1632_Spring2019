# CS 1632 Midterm 2 Exam Study Guide - Spring 2019

The midterm is on April 10th (MW classes) / April 11th (TH class).  You will have the entire class period to complete it.

The midterm will cover everything since the last midterm as well as systems testing the web (which we started the day before the last midterm).  I recommend you review the slides and the textbook (see syllabus.md for reminders of which chapters were required reading).

## WEB TESTING
* Be able to explain how you would test a web page with Katalon
* Understand difficulties of web testing and automated system testing in general
* You should know basic Selenese (Katalon/Selenium scripting language), e.g.
  * Opening a URL
  * Clicking on a link
  * Testing for text
  * You will not need to know about specifying target selection, but do need to know what target selection is and recognize it (i.e. if I show you a webpage, I will note specific target values for different elements - you will not need to read raw HTML)
* Understand why we don't just check the raw HTML of a page

## PERFORMANCE TESTING
* Understand concepts on how to test performance
* Be able to write test plans for different performance indicators and systems
* Terminology: Service-Oriented vs Efficiency-Oriented Indicators
* Availability, Response Time, Throughput, Utilization
* Performance targets, performance thresholds, KPIs - understand and be able to generate!
* Measuring response time - methodologies
* Understand different concepts of time: user, system, total, real
* Measuring availability and throughput
* Understand n 9's (e.g., 5 9s vs 6 9s)
* Load testing - baseline, soak/stability, stress tests
* Understand how to read flame graphs and optimize code based on them

## PROPERTY-BASED TESTING
* Be able to write property-based tests with Rantly
* Be able to name invariants given a function and sample input/output
* Be able to show how invariants are broken (fail)
* Understand what shrinking is and be able to shrink an input given an error using the same "binary error search" methodology covered in class (you will _not_ need to know more advanced shrinking techniques e.g. shrinking data types other than arrays or absolute value minimization)
* For what kinds of functions is property-based testing useful?  For what kinds is it less useful?

## INTERACTING WITH STAKEHOLDERS
* Be able to name some stakeholders and what is important to them (e.g. upper management, project management, testers, other developers)
* Be able to put together a red-yellow-green template report

## TESTING STRATEGY
* Understand the testing pyramid
* Understand common anti-patterns (ice cream cone, cupcake)
* Given a description of a program, be able to develop your own testing strategy