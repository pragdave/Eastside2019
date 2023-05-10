# First

* Introductions
* Why functional
* What we're going to do
* How we're going to do it
* Interact (but please signal before talking)

* iex
  * exiting
  * command editing
  * tab completion
  * help

* What is programming?
  * transforming data
  * imperative style: code drives the data
  * functional style: data drives the code

* eg double every number in a list
  * imperative
  * functional
      `[1,2,3] |> Enum.map(fn x -> x*2 end)`
      `[1,2,3] |> Enum.map(&(&1 * 2))`

### Lab

* add two
* square
* add two then square

### Useful stuff

* couple of data types
  * `[ ... ]`: list
  * `start..end`: range

* `:rand.uniform(n) : random number 1..n`

### Lab

* Create a list of four random numbers between 1 and 6



# Second

### Organizing source

* Code along:

  ~~~
  mkdir master
  cd master
  mix new game
  cd game
  tree
  ~~~

* `mix test`
* break code and retest
* explain `def`

### Lab

* make uniform list generator into function

* write a couple of tests (length == 4, values in 1..6)

### Pattern matching

* Code along

  ~~~
  iex> a = 1
  iex> a
  iex> 1 = a
  iex> 2 = a
  ~~~

* Explain
* Egs with list and range
* Show with functions
* Show `sum_up_to`
* Induction

### Lab
The Greatest Common Divisor of two integers is the largest integer that
divides both of them: the gcd of 16 and 40 is 8, for example.

One version of Euclid's algorithm for finding the gcd is:

~~~ python
function gcd(a, b):
    if b == 0:
       return a
    else:
       return gcd(b, rem(a, b))
~~~

Write this as an Elixir function without using any conditional logic.

### Lists

How would you sum a list?

* show `[h|t]` and `[]` pattern match

* what's a recurrence that finds the sum of a list?



- - - -

### Processes

spawn fn -> :timer.sleep(2000); greeter.() end

really fast and lightweight

Joe sequencer story

Process ID. Everything in process. self()

### Messages

What can you do with a process. 1 thing: send it a message

send self(), "Hello world"

diagram

iex> flush

iex> reader = fn ->
receive do
  msg ->
    IO.puts "Received:"
    IO.inspect message
end
end

Show message loop in module.

Add state.


Nodes

:inet.getif

Build IP

'assign a..e'

everyone iex -name <>

everyone Node.list

a: Node.connect :"b@..."
c: Node.connect :"d@..."

b,d list, a,c list, e list

e: Node.connect d@

everyone list

a: Node.connect e

list


