# Billcoin

You have probably heard of Bitcoin or another cryptocurrency such as Ethereum, Litecoin, or Monero.  For this deliverable, we will verify blockchains for the Billcoin protocol.

Blockchains consist of a "block" of data, which in our case will simply hold a list of transactions associated with that block.  Each block is verified to be internally consistent with the previous elements in the blockchain, e.g., block 1 comes after block 0, block 1 was created at a later time than block 0, there are no transactions where somebody gives away more coins than they own, etc.  Any user can then view the blockchain and verify that nobody is cheating.  Verifying a blockchain tends to be computationally intensive - the current Bitcoin blockchain is well over 150 gigabytes and takes at least a day or two to verify on even a powerful personal computer.  This is one of the reasons that we will do performance testing on our project to ensure that it goes as quickly as possible.

To understand how blockchains work, you must first understand hashing.  Hashing gives you a specific, finite value for an arbitrary sequence of values.  It will allow us to compare data without looking at every single character.  Let us imagine an extremely simple hash function, which only accepts capital letters, and returns a single value between 0 and 25 for that string.  The function accepts a string (which consists only of capital letters), and converts each letter to an equivalent value based on its alphabetical location (e.g A = 1, B = 2, C = 3, ... Z = 26).  We now add each value, and then take that final value, modulo 26.

Let's walk through an example using the phrase "AVOCADOS".  We start with a counter - call it n - at 0.  A is equal to 1, so we add 1 to the counter.  V is equal to 22, and so on.  This can also be expressed as 1 + 22 + 15 + 3 + 1 + 4 + 15 + 19, or 80.  Remember that we are mapping to a finite range of 0..25, though, so we take 80 % 26 = 2.  The "hash" of the string is thus 2.  Modifying any character would give a different hash.  We can thus "prove" that the hash goes along with the data, or compare data by comparing hashes.  Although in our case there is a 1 in 26 chance of a "hash collision" (different data leading to the same hash), by increasing the size of the hash value and using a better hashing algorithm, we can minimize that risk.  Cryptographically secure hashes tend to be 256 bits or larger, meaning that a chance of collision is much lower than 1 in 26 (it's 1 in 115792089237316195423570985008687907853269984665640564039457584007913129639936, or 0.00000000000000000000000000000000000000000000000000000000000000000000000000086% - similar odds to picking out the correct atom out of all the atoms in our solar system).

The hash function for Billcoin is defined as taking the following value for each character's UTF-8 value(note: the '**' operator means "to the power of", e.g. 2^3 (two cubed) is expressed in Ruby as `2 ** 3`):

```
((x**3000) + (x**x) - (3**x)) * (7**x)
```

Get the result of this calculation for each character, and then sum up the results.  This sum is then taken modulo 65536, and displayed as up to four hexadecimal characters ("hexits").  That is, leading 0's in the final hash string should not be displayed - "aaa" and not "0aaa".  All hexadecimal digits shown should be in lowercase - "aaa" not "AAA".  For an example, see the file `hash_walkthrough.txt` in this directory.

Input for hashes should be considered as a string, e.g., reading the value 555 is three characters -- ['5', '5', '5'] -- not the number 555.

It is guaranteed that all characters in the blockchain file are UTF-8 characters.

Now we want to ensure that the block we are creating has been created immediately AFTER the previous block.  We will thus hash the previous block's hash value as part of our data string to prove that it comes right after it.  Therefore, any change would be detected by the hash function.

For example, assume that block 1 has the hash value `98a3`.  When I create the hash value for block 2, I include the value `98a3` as part of the string I am hashing.  This proves that this block comes immediately afterward.  If I try to say that it came earlier, I would have had to change not just the block number but also the hash (and the hashes of any blocks afterward, since those will also depend on the hash value of this block).

However, this does not prove that much work has been done!  Calculating a hash value, even a cryptographically useful one (such as SHA256, the hash function used in Bitcoin - see http://www.xorbin.com/tools/sha256-hash-calculator), takes a minuscule fraction of a second on a modern computer.  However, trying to calculate a specific hash is very difficult and will require many attempts!  This is just like how it is easy to generate a password with certain parameters (say, at least one special character - I can very quickly come up with `llama&llama` or `a*isborn`), but selecting the _correct_ password to an account, even knowing its generating parameters, is very difficult.

If this were an actual cryptocurrency, this is where the "nonce" value would come in.  This is a value added to the block, and hashed with it (along with the data and previous hash) to try and make a hash value with specific properties.  However, for this deliverable, we will ignore the nonce (nobody is mining Billcoin for profit, anyway).  We will just give one user the "reward" (aka the "coinbase") for a block and assume that they are the miner.  All blocks will have a reward as the LAST transaction in them.

User addresses are exactly six decimal digits (0..9) long.  For example, "019832" and "123456" are valid addresses; "ab89cd", "111", and "1234567890" are not.

Let's look at a sample Billcoin blockchain (this is a copy of the actual file `sample.txt` in this directory):

```
0|0|SYSTEM>569274(100)|1553184699.650330000|288d
1|288d|569274>735567(12):735567>561180(3):735567>689881(2):SYSTEM>532260(100)|1553184699.652449000|92a2
2|92a2|569274>577469(9):735567>717802(1):577469>402207(2):SYSTEM>794343(100)|1553184699.658215000|4d25
3|4d25|561180>444100(1):SYSTEM>569274(100)|1553184699.663411000|38c5
4|38c5|569274>689881(33):532260>794343(15):532260>236340(4):402207>070668(1):236340>600381(1):070668>039873(1):SYSTEM>937639(100)|1553184699.666989000|24a2
5|24a2|689881>390411(3):SYSTEM>537882(100)|1553184699.674303000|10a9
6|10a9|SYSTEM>338967(100)|1553184699.677339000|d80e
7|d80e|735567>995917(1):577469>995917(1):735567>600381(1):SYSTEM>402207(100)|1553184699.680345000|a27b
8|a27b|039873>951990(1):532260>444100(1):390411>255185(1):561180>577469(1):236340>471345(1):SYSTEM>444100(100)|1553184699.685386000|a91
9|a91|402207>794343(10):402207>780971(13):794343>236340(16):717802>717802(1):SYSTEM>689881(100)|1553184699.691433000|676e
```

Each line consists of one block.  A block consists of the following elements, separated by pipes (`|` characters):

1. The block number (always starts at 0 and always increments by one each block)
2. The hash of the previous block (note that this is 0 for the first, or "genesis", block)
3. A sequence of transactions, separated by colons (`:` characters).  Each transaction is of the form FROM_ADDR>TO_ADDR(NUM_BILLCOINS_SENT).  FROM_ADDR and TO_ADDR are addresses, which consist of exactly six numeric characters (`0-9`).  The value in parentheses, NUM_BILLCOINS_SENT, is the number of billcoins sent from FROM_ADDR to TO_ADDR.  For example, `402207>794343(10)` indicates that the address `402207` sent 10 billcoins to address `794343`.
  * Note that the last transaction is from the SYSTEM itself.  This is the reward for creating a block and in our case is given to a random user - SYSTEM coins are created at each block and given to a user.  This is the only way billcoins are "minted" and introduced into the system.  The last transaction of a block should ALWAYS be from SYSTEM.  Every block should thus always have AT LEAST one transaction.  Block 0 should only have one transaction, the reward block, because at the beginning of the blockchain, nobody has any billcoins to transfer.
4. A timestamp, consisting of seconds since the epoch, a period, and the number of nanoseconds in that current second when the block was created.  This number should always increase from the previous block's timestamp.  It should never be the same or move "backwards in time".
  * Note that the timestamp is NOT a floating-point value.  It is two numbers - one indicating the seconds since the epoch and another indicating the number of nanoseconds since that second.  For example, 100.8 is 100 seconds plus 8 nanoseconds, and 100.1000 is 100 seconds plus 1000 nanoseconds.  Thus, 100.1000 is later in time than 100.8.
5. A hash of the first four elements (where each element is the value "between the pipes" of the string - in other words, the string to hash can be generated by interpolating the following string - "#{block_number}|#{previous_hash}|#{transaction_string}|#{timestamp_string}"), using the algorithm:
  * Unpack each character via U* (`string_to_hash.unpack('U*')`), thus converting them to its UTF-8 value
  * For each value in the string, x, perform the following calculation `((x**3000) + (x**x) - (3**x)) * (7**x)` and store that value
  * Sum up all of those values
  * Determine that value modulo 65536
  * Return the resulting value as a string version of the number in base-16 (hexadecimal)
  * See the file `hash_walkthrough.txt` for detailed steps walking through a simple hash.
  * Note that the hash includes the first four elements of the string including the pipe delimiters.  It does not include the final pipe delimiter since we haven't added the final data element yet.  For example, for the first block in `sample.txt`:

```
irb(main):022:0> calc_hash "0|0|SYSTEM>569274(100)|1553184699.650330000"
=> "288d"
```

Transactions must be valid on a per-block basis.  This means that there may be a point mid-way through the block that an address has a negative balance, but every address should have a nonnegative balance (>= 0) by the end of the block.

For example, assume 111111 has 5 billcoins in their account and 222222 has 0, and you receive this block.

```
8|e01d|222222>333333(3):111111>222222(4):SYSTEM>444444(100)|1518839370.605237540|c87b
```

Your first thought might be that this is invalid, since 222222 gave 333333 3 billcoins "before" 111111 gave 222222 4 billcoins, and thus 222222 has 0 billcoins to give in the first transaction.  However, in Billcoin, blocks are considered to be "instantaneous", so the ordering is not fixed.  At the end of the block, 222222 has 1 billcoin, 333333 has 3 billcoins, and 111111 has 1 billcoin, all of which are valid.

There are many reasons that a blockchain will fail to be verified.  I expect you to test for these as well as think of any additional ways that an invalid blockchain may be detected.  Examples include:

1. Hash or previous hash of a block is not correct
2. Timestamp does not increase strictly (make sure you understand the timestamp format!)
3. An address, at the end of any block, has a negative balance
4. An invalid address (anything other than six decimal digits)
5. An invalid character was found on a line (extra pipe (`|`), for example)

Upon discovering an error in verification, your program shall indicate which line contains the error and what the error is (e.g., invalid character, invalid address, timestamp did not increase, etc.)  If possible, it should indicate what it _expected_ the value to be.  This will not be possible for things like "unable to parse line" errors, but is for things such as bad previous hash.

Otherwise, if the blockchain is entirely valid, your program should print out all addresses which contain billcoins, and their associated number of billcoins.  You should not print out any addresses that have 0 billcoins after the final block has transacted.  You must print these values out in ascending order of the address, with the lowest number address first and the highest number address last (e.g., if you have addresses "000008", "100000", and "900000", they should be printed in that order, as 000008 is the lowest number, 100000 is in the middle, and 900000 is the highest).

See the `sample_output.txt` file in this directory for the correct output for a variety of different input files including errors.

I recommend that you first work with `sample.txt` (a very short blockchain) and get the correct values printed out for the number of billcoins.  Then work on various edge cases and failure modes, using the other "error" files in this directory to double-check your verification.  You may also make copies of the files and modify them to express other failure modes.  You should be writing unit tests during these steps.

After this is done, double-check that your program properly verifies `long.txt` - if your program can properly verify a 10,000-block chain, there is a good chance your core functionality is working well.  Once you have everything working and tested, you can then start doing some performance analysis.

For your final timing and performance analysis, you should use `long.txt` as the input file.  You may use `100.txt` and `1000.txt` for practice runs, as they should take much less time than `long.txt` to verify.  If not, you have discovered an O(1) way to verify blockchains and we can write a paper together, as long as you promise to share the Turing Prize.

NOTE: You may use the `sample.txt` blockchain for your flamegraph (although you should use `long.txt` for the times).  This should still give you a good idea of where the hot spots are in your application but it is less likely to cause an error when rendering in your browser.

For our Billcoin blockchain verifier, the performance target is < 20 seconds to verify the 10,000-entry blockchain `long.txt`.  The performance threshold is < 180 seconds to verify it.  The target and threshold should be calculated based on a a 2.3 GHz Macbook Pro with 16 GB of RAM, running no other programs besides necessary system daemons and the like.  You may adjust based on your computer's specifications, but final times will be determined based on my computer as specified above.  Please feel free to email me if you would like any information on other specifications of the reference computer.

Note that this project is a very, very simple implementation of a blockchain, missing many important concepts (e.g. mining, signatures, hash function tradeoffs, dealing with chainsplits, etc.). If you are interested in a deeper understanding, I recommend the following resources:

1. "Bitcoin: A Peer-to-Peer Electronic Cash System" by Satoshi Nakomoto (alias) - (the original theory behind Bitcoin) - https://bitcoin.org/bitcoin.pdf
2. The Ethereum Whitepaper (the original theory behind Ethereum) - https://github.com/ethereum/wiki/wiki/White-Paper
3. The Ethereum Yellowpaper (the implementation of Ethereum) - https://github.com/ethereum/yellowpaper
4. "Mastering Bitcoin" by Andreas Antonopoulos (book on the technical details of Bitcoin)
5. "Mastering Ethereum" by Andreas Antonopoulos and Gavin Wood (book on the technical details of Ethereum)
6. "Bitcoin for the Befuddled" by Chris Wilmer (a professor at Pitt) and Conrad Barski
7. "Introducing Ethereum and Solidity" by Chris Dannen (book introducing Ethereum)
8. "The Age of Cryptocurrency" - Good introduction to the world of Bitcoin and other cryptocurrencies in a "pop tech" form
9. "How Money Got Free" - Similar book to "The Age of Cryptocurrency" but much more focused on Bitcoin specifically
9. "Strength in Numbers" by Bill Laboon - A science-fiction novel exploring a world where cryptocurrency has eliminated traditional money
