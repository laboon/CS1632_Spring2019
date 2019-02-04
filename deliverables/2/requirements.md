1. The program shall be run by typing `ruby ruby_rush.rb` at the command line along with three arguments, the `seed`, the `number of prospectors`, and the `number of turns`, in that order.  All arguments shall be integers.  If there are not three arguments, the arguments cannot be interpreted as integers, or the number of prospectors or number of turns is not a non-negative integer, the system shall report the correct usage (i.e. explain what kind of values to pass in as arguments) and exit with exit code 1.  In all other circumstances (i.e. the arguments were valid) the program shall exit with exit code 0 after executing the simulation.

2. The program shall create all pseudorandom numbers from the seed passed in as an integer argument to the program (as explained in requirement 1).  Thus, the system is entirely deterministic and thus repeatable with the same arguments.

3. The seven locations on the map shall be as follows: Enumerable Canyon, which connects to Duck Type Beach and Monkey Patch City; Duck Type Beach, which connects to Enumerable Canyon and Matzburg; Monkey Patch City, which connects to Nil Town, Enumerable Canyon, and Matzburg; Nil Town, which connects to Monkey Patch City and Hash Crossing; Matzburg, which connects to Monkey Patch City, Duck Type Beach, Hash Crossing, and Dynamic Palisades; Hash Crossing, which connects to Matzburg, Nil Town, and Dynamic Palisades; and Dynamic Palisades, which connects to Matzburg and Hash Crossing.  It may be easier to view a graphical depiction of the map:

```
Nil Town-----------------------------
     \                              |
      \                             |
  Monkey Patch City                 |
       |     \       /---------- Hash Crossing
       |     Matzburg----              |
       |            |    \             |
       |            |     \---------- Dynamic Palisades
       |            \____
       |                |
Enumerable Canyon ---- Duck Type Beach
```

4. A prospector shall always start in Enumerable Canyon.

5. At each location, a prospector shall search for rubies and the number of rubies and fake rubies found will be shown.

6. Prospectors shall leave a location if they find no rubies and no fake rubies.  If they find any rubies or fake rubies, they will stay at the location for another iteration.

7. When a prospector leaves a location, they will travel to one of the connected locations for that location, chosen pseudorandomly.  For example, Dynamic Palisades is connected to Hash Crossing and Matzburg, so a prospector leaving Dynamic Palisades shall always head to one of those two locations.

8. A prospector shall prospect until they have visited the number of locations indicated by the third argument, `number of turns`.  This may include "repeats" - for example, a prospector who went to Enumerable Canyon, Duck Type Beach, Matzburg, Duck Type Beach, Enumerable Canyon has visited five locations, even though they visited only three unique locations.

9. Prospectors shall find the following MAXIMUM amounts of rubies and fake rubies at each iteration at each location.  Note that the numbers indicated are a maximum.  Prospectors shall find between 0 and the maximum number rubies or fake rubies (using a continuous distribution - e.g., if the maximum is 2, then a prospector should have an equal chance of finding 0, 1, or 2 rubies) per iteration.

```
Location          | Max Rubies | Max Fake Rubies
------------------------------------------------
Enumerable Canyon |    1       |    1
Duck Type Beach   |    2       |    2
Monkey Patch City |    1       |    1
Nil Town          |    0       |    3
Matzburg          |    3       |    0
Hash Crossing     |    2       |    2
Dynamic Palisades |    2       |    2
------------------------------------------------
```

10. When heading to a new location, the simulator shall display the new location.

11. The prospector's location information shall be printed out without a leading tab; information on rubies found shall be indented by one tab.

12. After a prospector has visited the number of locations specified by the initial argument `number of turns` and thus finished prospecting, the number of rubies and fake rubies the prospector has discovered shall be displayed.

13. When displaying information, the correct singular and plural forms shall be used, e.g. "0 rubies", "1 ruby", "2 rubies".

14. The simulation shall run the number of times indicated by the second argument to the program, `number of prospectors`.  Prospectors shall be named "Rubyist #n" where n is their number, starting with #1 (there shall be no Rubyist #0).

14. A "day" shall be defined as one search for rubies.  A prospector may have multiple days in a single location.  However, a prospector will always spend a minimum of one day at a locations searching for rubies.

15. After a prospector has completed the `number of turns` iterations, they shall "go home", ending the simulation for that prospector.  At this point, the simulator shall first indicate how many days the prospector was searching for rubies.  It shall then indicate one of three messages, based on the number of rubies they have found: "Going home victorious!" if they have found ten (10) or more rubies, "Going home sad." if they have found between one (1) and nine (9) rubies, and "Going home empty-handed." if they have found zero (0) rubies.  Fake rubies are not counted as rubies and shall be ignored for these calculations.

16. Output shall be as close as possible to that displayed in the `sample_output.txt` file in this directory.  This file shall be used to resolve any ambiguities in these requirements.