---
layout: single
title: Programming Tutorial I
category: Getting Started
permalink: /categories/getting_started/programming_tutorial_I
excerpt: "Why do we need programming languages?"
description:
  First part of our programming tutorial blog series. Why do we need programming
  languages?
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

Long time no see! We are finally back diving into the topic of programming
languages. Before we bring our hands to a first language, we want to talk about
programming languages in general. What are they, and why do we need them? Why
are there so many of them? What concepts do they share?

## Why do we need programming languages?

To answer this question, we need to talk about how a computer works. Don't
worry! The hardcore stuff will be explained in our category
[Digital Design](/categories/digital_design/). Here, we just need some basic
understanding. Let's start with a very fundamental question: What is a
**program**? A program is essentially a sequence of **instructions** that tells
the computer what to do. Instructions can be very simple like an addition, but
they also can be rather complex by doing multiple things at the same time.
Before we provide a simple example, we have to clarify the term **register**. In
our first post, we already talked about different memory types to store data:
RAM, HDD, and SDD. Registers are another way to store data and are part of the
processor. A register basically stores a single number. Registers are the
fastest memory type out there, but they are the most expensive ones at the same
time. This is why most processors have only a few of them.

Let's imagine we have a processor with two registers (r1, r2) and two supported
instructions. One to load numbers into a register (called _mv_, for "move") and
another one to add the values stored in two registers (_add_). Now, we can
combine these instructions to create our first program:

    mv r1, 1
    mv r2, 2
    add r1, r2

The above is an example of a so-called **Assembly** program. The assembly
language is a programming language that consists of instructions that the
processor can directly execute. In our example, we first load the values 1 and 2
into registers r1 and r2. If we assume that the result of our addition is stored
in the first register, r1 will contain the value 3 at the end of our program.
Cool, isn't it? But to be honest, we skipped one step. As you might know, a
computer only understand 0's and 1's. Instructions like _mv_ or _add_ are
already a human-readable form. Before you can run it, a program called
**Assembler** has to convert it to **machine code** (= 1's and 0's
representation of the instructions). Let's assume that _mv_ is converted to
1010, r1 is converted to 0010, and 1 is converted to 0001. Then, our first
instruction could look like this: 101000100001. This is what a CPU can
understand. Now, imagine a file full of 0's and 1's. Do you think anyone can
directly understand what the program does? No! It would be a nightmare. That's
the first reason why we need programming languages: **Readability**.

Let's think a bit further. Imagine that you spent hours writing your program and
then you want to use it on a different processor. But what if on that new
processor, the instructions and registers are different? This means that you
have to rewrite your code which is a lot of work! Trust us when we tell you that
this is not feasible in most cases. What you want to have is a programming
language that is independent of the underlying hardware. So-called
**high-level** programming languages like _C_ or _Python_ were invented for this
purpose. Consequently, our second reason to use programming languages is
**Compatability**. So, we write code in one of these higher-level programming
languages, and there are tools (that we will cover in the next section) that
convert it into runnable machine code for most processors.

Lastly, each programming language is developed to **optimize** a specific use
case. So, depending on what you want to do, you'll choose a different language.
A graphical application, for example, would require a language with graphical
elements, while some scientific calculator apps would require mathematical
functions. But don't think that this is an easy choice. Discussions about which
language fits best can almost be religious. In the following section, we want to
present two general types of languages.

## Interpreted vs compiled languages

There exist hundreds of programming languages. But they all can be divided into
two groups: **interpreted** and **compiled** languages. When you followed our
previous posts, then you already used an _interpreter_: your Linux shell. An
interpreter is a program itself that translates and executes commands given to
it one by one. So, a command such as _ls_ is converted into 0's and 1's and then
executed by the CPU. In contrast, compiled languages are _compiled_ (=converted)
into machine code (0's and 1's) once (usually) by the developer. This has to be
done once per supported machine to adapt to different underlying hardware
features, such as a different number of registers. Because they are executed on
the machine directly, compiled languages are usually way faster than their
interpreted counterparts. This will be enforced by several optimization steps of
the **compiler**. We will talk about this in a later post. Interpreted
languages, however, are more flexible. For example, in some interpreted
languages, you can change the program while it is running. Also, it is usually
faster to code in interpreted languages.

Over time, people tried to merge the advantages of both kinds, which resulted in
many hybrid versions. Interpreters can call compiled programs and there are
things like a **just-in-time compilation**. But do not worry about that now. We
will come back to it at a later point.

Congratulations! This was your first step into programming languages. Let's
summarize ...

## Summary

At the end of this post, you should be convinced that we need programming
languages for the following reasons:

- **Readability**: Nobody can read 0's and 1's. We need a human-readable form
- **Compatibility**: We want a program to run on several machines
- **Optimization**: Programming languages can simplify specific tasks. Compilers
  can further optimize the program written by the developer

Furthermore, you should know the difference between the following types of
programming languages:

- **Interpreted** languages: Translated to machine code and executed just in
  time.
- **Compiled** languages: Previously compiled machine code is run by the user
- There exist hybrid approaches combining the advantages of both

In our next post, we will talk about common programming concepts. Hope to see
you soon and don't forget to follow us on
[Twitter](https://twitter.com/bitsandvolts)!
