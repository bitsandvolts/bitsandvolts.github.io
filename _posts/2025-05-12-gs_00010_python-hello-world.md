---
layout: single
title: "Python: Hello World"
category: Getting Started
permalink: /categories/getting_started/python_hello_world
excerpt: "Your first Python Program"
description:
  In this blog post you will learn how to write your first Python program.
author: Bjoern Hartmann
toc: true
toc_label: "Content"
toc_sticky: true
toc_icon: "align-justify"
sidebar:
  nav: "getting_started_0"
header:
  overlay_color: "#000"
  overlay_filter: "0.5"
  overlay_image: /assets/images/getting_started.jpeg
---

Welcome back to our next post where you'll finally learn how to write your first
Python program. In our latest [post](/categories/getting_started/visual_code),
we introduced VS Code, a modern and flexible IDE. The prepared profile, which we
used to set up the editor, already includes extensions for the Python language.
So, everything should be ready to get started. In another previous post about
[programming concepts](/categories/getting_started/programming_tutorial_II), we
learned about concepts, such as functions or loops, that all programming
languages have in common. We will see how these simple structures are used in a
working program.

Python is one of the most beginner-friendly programming languages, known for its
readability and simplicity. Therefore, it's a perfect starting point for us.
Once you know how to use one language it's just a small step to learn another
language. The core principles are always the same. In our first program, we'll
implement the traditional "Hello, World!".

## Hello World!

A "Hello, World!" program is usually the first piece of code written when
learning a new programming language. It does something very simple: It displays
the message **Hello, World!**. While it may seem trivial, this program serves a
very important purpose. First, it helps to verify that your development
environment is set up correctly. If the program runs and outputs "Hello, World!"
to your screen, you know that your interpreter, editor, and everything else are
working as expected. Secondly, it introduces the basic syntax of the language.
It shows how to output data to the console, which is a fundamental capability in
programming. Lastly, it serves as a confidence booster. By successfully running
your first program, you're building momentum for more complex projects.

Inside VS Code, open a folder of your choice and create a new file
_hello_world.py_. By the _.py_ extension, VS Code knows immediately that it is a
Python file. In the lower-right corner, VS Code shows that it is in Python mode
and it shows the current Python version (see the picture below). Just a quick
note on Python versions: Each version introduces new features of the programming
language. Usually, this is backward compatible. So, a program written for Python
3.6 also works for our 3.13 version. This is not true for major releases. It's
not possible to run a Python 2 program with Python 3.

Now, write the following code and save it:

```python
    print("Hello World!")
```

The code is probably very easy to understand. _print_ is a Python function that
can be used to print a message to the console. The message itself has to be
within single or double quotes. To run the code you can hit the run button in
the upper-right. This will open a terminal where your Python script is executed.
If everything goes well you should see the _Hello World!_ output. Alternatively,
you can directly run the program by typing _python hello_world.py_ into the
console.

Congrats! This was your very first Python program.

<figure class="img-center" style="width:85%">
  <img src="/assets/images/gs_00010_python_hello_world.png" title="Hello World" alt="Hello World">
</figure>

Note that the terminal probably looks different for you. We will cover this in a
later post.

## Python as Calculator

In most cases, you will write all Python commands into a file and execute the
file, as we did in our _Hello World!_ program. However, sometimes it is useful
to execute the commands interactively. Inside the terminal, just type the
command

    $ python

This will lead you to an input prompt where you can type your Python commands,
for example, the _print("Hello World!")_ command from the previous section. You
can also do calculations such as _3\*3_. This can be very handy. Just play
around with it!

<figure class="img-center" style="width:85%">
  <img src="/assets/images/gs_00010_python_calculator.png" title="Python as calculator" alt="Python as calculator">
</figure>

## Let's Build a Counter

Now that you’ve successfully written your first Python program, let’s build
something a little more useful: a counter. This simple project will introduce us
to more key concepts in Python, such as variables, loops, functions, and
conditional statements.

### Starting with a simple counter

We can begin by writing a basic counter that prints numbers. Create a new file
_counter.py_ and add the following code:

```python
count = 1
print("Count is:", count)
```

In this case, we define a **variable** called count and set it to 1. The print()
function is used to output the value of count to the screen. Unlike printing a
fixed message like "Hello World", notice that we don't put the variable name in
quotes. Doing so would print the word "count" instead of its value.

> Count is: 1

### Adding a while Loop

Next, let's use a **while loop** to make the counter print numbers from 1 to 5.
A loop helps us automate repetitive tasks, so instead of manually printing each
count, we can write a single block of code that runs until a condition is met.

Here’s how we modify the counter to use a loop:

```python
count = 1
while count <= 5:
    print("Count is:", count)
    count += 1
```

In this version, the variable count starts at 1. The while loop checks whether
count is less than or equal to 5. As long as that condition is true, the loop
keeps running. Inside the loop, the program prints the current value of count,
then increases it by 1 using count += 1. Once the count reaches 6, the condition
becomes false, and the loop ends.

An important detail here is **indentation**. Python uses indentation to show
which lines of code belong to the loop. Any indented lines after the while
statement are considered part of the loop and will be repeated each time it
runs. Without the correct indentation, Python won’t know what to include in the
loop and will raise an error.

> Count is: 1<br> Count is: 2<br> Count is: 3<br> Count is: 4<br> Count is: 5

### Encapsulating the Code in a Function

Another useful concept in programming is the **function**. Functions allow you
to group code to be reused in different parts of your program. Let’s put our
counter logic into a function:

```python
def simple_counter(target):
    count = 1
    while count <= target:
        print("Count is:", count)
        count += 1

simple_counter(5)
```

Functions are **defined** by the keyword _def_ followed by a function name.
Here, we additionally add a **parameter** with the name _target_ to set the
upper limit for our counter. Observe that the previous limit _5_ is replaced by
the parameter. Also note that again indentation defines which commands belong to
the function.

At the end, you just have to **call** the function passing a value for the
parameter. If you pass _5_, the output is exactly the same as with the previous
code without function. Using functions has three major benefits:

1. **Code organization**: It is easy to understand your code if it is structured
   in small logical blocks.
2. **Reusability**: If you need a second counter, you just need to call the
   function again
3. **Abstraction**: Functions can be very complex, but often it's not required
   to know how they work. It is sufficient to know what they do and how you can
   use them. Take the print() function as an example. We didn't explain how it
   works, but you still can use it.

### Conditional statements

Next, we want to improve the text output using the following logic:

- If the count has reached the target, print "finally done".
- If the count is greater than or equal to the target minus 2, print "almost
  there".
- Otherwise, print "stay patient".

We can use **if-else** statements to directly translate this logic into
programming code:

```python
def simple_counter(target):
    count = 1
    while count <= target:
        if count == target:
            print("Finally done! Count is:", count)
        elif count >= target - 2:
            print("Almost there! Count is:", count)
        else:
            print("Stay patient! Count is:", count)
        count += 1

simple_counter(5)
```

**if** is used to check for a condition. Note that if you want to check for
equality, you have to use "==" and **not** "=". This is a common beginner
mistake. **elif** (short for 'else if') is used to check a second condition if
the if condition is false. You can include as many elif clauses as needed.
**else** handles all remaining cases and acts as the "otherwise" in your
program. Again, indentation shows which command belongs to which structure.

> Stay patient! Count is: 1<br> Stay patient! Count is: 2<br> Almost there!
> Count is: 3<br> Almost there! Count is: 4<br> Finally done! Count is: 5

### Comments

"What the fu\*\* have I done here?" - This is a question you will probably ask
yourself very soon. Sometimes, code is complex and to be able to understand it a
few days (or years) later it is crucial to leave some comments. For functions,
it is good practise to explain what they do in the first line. For other
locations it depends. A general rule is to comment as little as possible but as
much as necessary. There are three major ways of commenting in Python:

```python
def simple_counter(target):
    """
    Prints numbers from 1 up to the given target (inclusive).

    This is a Docstring, which is often used for documenting functions
    """
    count = 1
    while count <= target:
        if count == target:
            print("Finally done! Count is:", count)
        elif count >= target - 2:
            print("Almost there! Count is:", count)
        else:
            print("Stay patient! Count is:", count)
        count += 1

# I am a single-line comment
simple_counter(5) # I am an inline comment
```

## Side Note: Indentation & Style Guides

You've learned already that indentation is crucial for structuring your program.
In Python, it plays an even more important role because it defines which
commands belong to which blocks of code. However, we haven't yet defined what
indentation actually is. The reason is that there’s no single standard and
programmers often debate the best way to handle it. On the one hand, you can use
**tabs**, which take up less space in a file but may look different depending on
the editor or environment. On the other hand, you can use **spaces**. Typically,
2 or 4 spaces are used. Spaces offer a consistent appearance across all tools.
In this blog, we’ve chosen to use four spaces, as they provide a clear and
easy-to-read structure for your code. No matter what you use, use it
consistently!

Beyond indentation, there are many other aspects of coding style. For example,
notice that we use one empty line between the function definition and the
function call. This raises more questions:

- Where should I use empty lines?
- What’s the ideal maximum line length?
- How should variables be named?

There are many practical aspects that people try to standardize in so-called
**style guides**. For Python, the most popular style guide is
[PEP 8](https://peps.python.org/pep-0008/). While following such guides isn’t
mandatory, doing so helps you write clean, readable, and maintainable code.

## Summary

We hope you enjoyed writing your first Python program! Let's quickly recap what
we covered:

- _Hello World_ programs are used to test your environment
- Python can be used with scripts or interactively, for example, as a handy
  calculator
- You implemented your first program using basic programming concepts:
  - Printing to the console
  - Variables
  - Loops
  - Functions
  - Conditional statements (if-else)
  - Comments
- [PEP 8](https://peps.python.org/pep-0008/) is a popular style guide for
  Python.

In our next post, we’ll build on this foundation by exploring more core Python
concepts. Until then, happy coding, and don't forget to follow us on
[X](https://x.com/bitsandvolts).
