QUESTION:

 A pile of nuts is in an oasis, across a desert from a town. The pile contains 'N' kg of
nuts, and the town is 'D' kilometers away from the pile.
The goal of this problem is to write a program, in Ruby on Rails that will compute 'X', the
maximum amount of nuts that can be transported to the town.

The nuts are transported by a horse drawn cart that is initially next to the pile of nuts. The cart
can carry at most 'C' kilograms of nuts at any one time. The horse uses the nuts that it is
carrying as fuel. It consumes 'F' kilograms of nuts per kilometer traveled regardless of how
much weight it is carrying in the cart. The horse can load and unload the cart without using up
any nuts.

Your program should have a function that takes as input 4 real numbers D,N,F,C and returns
one real number: 'X'
Your program should also have a function that reads an input text file from the command line or
from a textarea in a website. This input contains an arbitrary number of lines. Each line is of the
form: D,N,F,C where D,N,F, C are integers in decimal notation. This function should write to
standard output(command line or web page) as many lines as the input file had. Each line
should contain the input and the result expressed in a single real number X.

As part of your submission, please add the output of the latter function when the input file is:
1000,3000,1,1000
1000,7000,1,1000
1000,100000,1,1000
1111,3000,1,1000
1000,3000,1,1111
1111,3334,3,4444
111,3333,3,2222
111,3333,3,1000
10000,1111111,3,1111
10000,1111111,5,1111
1000,1000000,2,1000
1111,22222222,5,3333
1000,12000,5,3000

>Add a Readme markdown to the project on how to run the program, also containing the
expected output for the sample input file above.

>Add unit testing to the program to prove the robustness of your result with different inputs.
This README would normally document whatever steps are necessary to get the
application up and running.




Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
