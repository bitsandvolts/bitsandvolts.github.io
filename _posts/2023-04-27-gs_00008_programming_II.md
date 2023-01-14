---
layout: single
title: Programming Tutorial II
category: Getting Started
permalink: /categories/getting_started/programming_tutorial_II
excerpt: "Basic programming concepts."
description:
  Second part of our programming tutorial blog series. In this post, we cover
  basic programming concepts such as if-else branches, for and while loops as
  well as functions.
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

Hello programming newbies! Welcome back to the second part of our programming
tutorial. Last time, we explained why we need programming languages. This time
we want to take an example from our daily life to discuss a few common
programming concepts. Additionally, we want to give some general advice on how
to get started with programming.

Ready? Then let's get started and make ourselves some pancakes!

## Pancakes for a programmer

Imagine you wake up on a Sunday morning and want to make some pancakes. A pretty
simple recipe could be: "Mix 200g flour, 2 eggs, and 200ml milk. Then, bake it
in a pan". Last time, we said that a program is a sequence of instructions that
tell the computer what to do. Similarly, a recipe is a sequence of instructions
that tell a human what to do. So, let's see how they can be compared!

First, it should be clear that you have to follow the recipe **sequentially**,
i.e. in order. You cannot put anything into the pan before you have mixed the
ingredients. The same holds for programs. They run sequentially. There are also
programs running in _parallel_. Imagine a friend helps you with the pancake. You
can measure 200ml milk while your friend measures the flour, but as a whole, you
still need to follow the sequential order (the pan still needs to wait).
Parallel programs are similar, but here we want to assume pure sequential
programs.

Let's start with the eggs. We have to take an egg, break it, and put it into a
bowl. Also, we need to throw the eggshells into the trash. For the second egg,
we have to do exactly the same. In a programming language, you can define a
**function** _put_egg_in_bowl_ to define a sequence that is used multiple times.
Next, you can **call** this function in a **loop** for every egg. So, a program
to prepare the eggs could look like this:

    function put_egg_in_bowl:
        take egg
        break egg
        put it into a bowl
        throw shell into trash

    for 2 times:
        put_egg_in_bowl

Note, that we use indentation (here we use 4 spaces) to show which instructions
belong to our function and loop. Also, note that this is not a real programming
language, but it serves our demonstration purpose.

After the eggs, we want to weigh the flour. How do you usually do it? You watch
the scale. While your target weight of 200g is not reached, you put more flour
into the bowl. In programming languages, there exist two types of loops. For the
one we used above, we know how often we need to repeat it (two times in our
example). This is called a **for-loop**. For weighing the flour, this is not
very useful since you don't know how often you have to put more. Instead, we
need a loop that continues while a _condition_ is true. This is called
**while-loop**:

    while flour < 200g:
        put more flour

You can read it like this: "Repeat putting more flour while the weight is less
than 200g." Once the weight of the flour reaches 200g, the while-loop is done.
We can continue very similarly for the milk:

    while milk < 200ml:
        put more milk

_flour_ and _milk_ represent the current amount. In programming languages, we
call these **variables**. In simple words, variables can store any kind of
information.

<div class='note-exercise' markdown="1">
Exercise:

Can you continue with the rest of the pancake?

</div>

While you're finally eating the pancake you often ask another question: "Do you
like the pancake?" If yes, you might want to recommend it to a friend. To
implement such a question you can use an **if-else-statement**:

    if pancake is delicious:
        recommend the recipe
    else:
        delete the recipe

The _if_ statement checks whether a condition is true. In our example, it is
checked whether the pancake is delicious. If that condition is true, the
instructions indented below the _if_ statement will be executed, in our case
recommending the recipe. If the pancakes don't taste good, the instructions
below the _else_ statement will be executed, here, deleting the recipe.

You might say that this is too easy and this can't be all you have to know to
become a successful programmer. Well... Yes and No! Of course, there is much
more to learn. But it turns out that even the most complex programs, all still
make use of those basic principles we've presented to you above!

## Programming beginners FAQ

Before we move on, let us answer some common questions asked by programming
beginners.

<div class='note-exercise' markdown="1">
Which programming language should I start with?
</div>

There is no general answer to this as it highly depends on what you want to do.
In this blog series, we will teach Python and C. Why did we choose these? Python
is very flexible and you can do almost anything with it. You can process data,
build graphical applications, work with artificial intelligence, and much more.
C is, for example, an ideal choice in combination with microcontrollers that are
often used by programming hobbyists for their home automation projects.
Moreover, both languages are pretty well established in the community for ages.
So, there exists an almost infinite number of public projects and you can get a
lot of help in forums. But in general, you should decide on your project first
and then do some research to see which language suits the best.

<div class='note-exercise' markdown="1">
Is it hard to learn a programming language?
</div>

No! You'll see that it does not take long to get your first program running.
From there on it is just experience. The more you code the better you get. We'll
guide you to make it as easy as possible for you.

<div class='note-exercise' markdown="1">
What is the best way to learn a programming language?
</div>

Get your fingers on a keyboard! Often we hear people say "First, I'll buy a book
and learn everything." Forget about it! Programming languages have almost
unlimited possibilities and even experienced programmers don't know all of them.
Start with some small basic tutorials like this blog series. Then, look for your
own project and a search engine of your choice will help you to succeed.

<div class='note-exercise' markdown="1">
It sometimes takes hours to solve a problem. Is it normal?
</div>

Yes, it is! Sometimes your program simply does not do what you want and it might
take a while to find out why. This can often be very frustrating. But this is
not only the case for beginners. Every programmer regularly struggles with it.
That's why it is also important to know how to investigate such issues. We'll
come back to it at a later point.

## Summary

We hope that we answered some of your questions. If you have further questions,
please use the comment section below. We are happy to assist. Lastly, let's
summarize the programming concepts we presented in the first section:

- **functions** bundle a sequence of instructions to be reused several times
- **for-loops** repeat instructions for a specified number of times
- **while-loops** repeat instructions while a condition is true
- **variables** store information
- **if-else-statements** trigger instructions based on a condition

In the next post, we will set up another editor for our first programming
language! Stay tuned, and don't forget to follow us on
[Twitter](https://twitter.com/bitsandvolts)!
