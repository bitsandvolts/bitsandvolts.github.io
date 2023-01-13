---
layout: single
title: File Permissions
category: Getting Started
permalink: /categories/getting_started/file_permissions
excerpt: "A Linux security mechanism."
description:
  File permissions are a Linux security feature. Learn how to handle them in
  this blog article.
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
  overlay_image: /assets/images/getting_started.jpg
---

Hello and welcome back to a new post, where we want to fill a small gap from our
previous posts, namely **file permissions**, or **privileges**. If you have been
following our posts in the **Getting Started** category, you have seen the
following command at a few points:

    $ chmod +x open_firefox.sh

If this command is completely new to you, feel free to read the previous posts
or keep reading because we explain it from the beginning. Let's get started!

## What are file permissions?

We already mentioned that a Linux system can be shared by multiple users. Now,
imagine you are working on a very important project. Then, you don't want that
another user can manipulate it. If it is a top-secret project, you probably
don’t even want any other user to see it. To handle such scenarios, Linux offers
**file permissions**.

In Linux, you can do three things with a file: **read**, **write** and
**execute**. Each of these actions can be restricted to several users.
Therefore, Linux has three levels of ownership called **owner**, **group**, and
**other**. Let's explain it with an example. Imagine a teacher or professor who
wants to provide an exam with some Linux questions. Obviously, the teacher is
the owner of the exam and he should be able to read and write it. The students
have to read the exam in order to know what to do. However, they should not be
able to write into the exam questions (at least from the teacher’s point of view
:-D). Otherwise, they could remove the questions they cannot answer. Maybe the
teacher wants to reuse parts of the exam for other classes, so students that are
not attending the exam should not be able to read the exam questions. How to
achieve this?

The teacher is the _owner_ of the exam and sets his own permission to read and
write. For the participating students, Linux offers a feature called _group_. It
actually does exactly what you expect from its name. It builds a _group_ of
several users. As a side note, you can use the following command to check which
groups you belong to:

    $ groups

So, the teacher can create a group with all students taking the exam and set the
group permissions to read-only. Everyone who is not the owner and does not
belong to the group is covered by the _other_ permissions. For the exam example,
there won't be any permissions for them.

Besides such simple examples, file permissions are an important security feature
of Linux. We don't want to dive too deep into this topic, but maybe you can
imagine that wrong permissions can open the doors for all kinds of security
issues. For now, we just want you to understand why you might get a "permission
denied" error as we have seen in previous posts.

## How to handle file permissions?

Enough about theory! Let's get our fingers on the keyboard! Open a terminal,
create a folder, change into it, and create a file:

    $ mkdir permissions
    $ cd permissions
    $ touch test

If this was too fast, don't worry. Take your time and read our posts
[Terminal Basics](/categories/getting_started/terminal_basics) and
[Terminal Basics II](/categories/getting_started/terminal_basics2). Now, we want
to check the owner and permissions of the created file using the known `ls`
command with a parameter:

    $ ls -l

<div class='note-normal' markdown="1">
Note: `ls -l` list all files in the current folder. You can also use
`ls -l test` to list the permissions of our specific test file.
</div>

<figure class="img-center" style="width:90%">
  <img src="/assets/images/gs_00006_file_permissions.png" title="File Permissions" alt="File Permissions">
</figure>

To be honest, the output looks a bit scary at the beginning, but it is not that
difficult. First, you see a combination of letters and dashes. The first symbol
describes the file type. Our test file shows a dash which means that it is a
regular file. A _d_, for example, would tell that it is a directory. Then, you
can see three permissions for the owner. _r_ stands for _read_, _w_ for write,
and the dash means that the execute permission _x_ is missing. Then, follows the
permissions trio for _group_ and _other_. So, the owner is allowed to read and
write, all group members and other users are only allowed to read the file. You
also can see the owner and group of the file which is in this case both set to
_bitsandvolts_.

Now, we want to show how to change the permission so that nobody except the
owner is allowed to read the test file.

    $ chmod go= test

How does this command work? _g_ stands for group and _o_ for other. In this
case, you don't set any permissions for the group and others for our test file
because there is no value behind the equal sign. Check if the command worked
with:

    $ ls -l

When you try to run the file by

    $ ./test

you will get a _permission denied_ error. Why? Of course, because it does not
have the execute permission. So, let's add it! You have multiple options to do
it. You can add the permission by:

    $ chmod u+x test

<div class='note-normal' markdown="1">
_Note: u stands for user and means the owner of the file. In case,
you want to remove a permission you can use the minus sign._
</div>

Or, you can set the complete user permissions by:

    $ chmod u=rwx test

Now, you can run the test file without error. Of course, it does nothing since
it is empty:

    $ ./test

One tiny note is missing: Who is allowed to change the file permissions? It
would be stupid if students could change the file permissions of the exam
themselves, wouldn't it? Only the owner of the file and the **superuser** can
change it. We talk about the superuser later, but it's basically the owner of
the machine who can do whatever he wants.

That's it! Easy, isn't it?

## Set permissions using numeric values

Very often there is more than just one way to achieve a goal. There is another
syntax using numeric values that is commonly used for file permissions. If you
want to set all permissions (read, write and execute) for the file's owner and
no permissions for everyone else you can also use the following command:

    $ chmod 700 test

How does this work? Behind the previously used `chmod` command, you see three
digits. The first represents the owner permissions, the second the permissions
for the group, and the last for all others. The following table shows the value
for each permission.

| Permission | Value |
| ---------- | ----- |
| Execute    | 1     |
| Write      | 2     |
| Read       | 4     |

If you want to combine multiple permissions you just add up the values.
execute + read + write is represented by 1 + 2 + 4 = 7. The other two values are
zero since we do not have any permissions for the group and others.

<div class='note-exercise' markdown="1">
Exercise:

What would be the command for our exam example? Teacher (owner) has read + write
permissions, participating students (group) has read and everyone else has no
permissions.

</div>

The solution is:

    $ chmod 640 test

You can decide for yourself which way you prefer. The way from the previous
section is maybe easier to remember, but both achieve the same goal.

## Summary

Congratulations! Now, you should be able to explain why you get a **permission
denied** error:

- Use `ls -l`to check the file permissions
- If you don't have the necessary permission you'll get a _permission denied_
  error
- Linux differentiates between **owner**, **group**, and **other**
- You can **read**, **write** or **execute** a file
- Use `chmod` to change the permissions
- One way is to use the abbreviations, e.g. `chmod ugo=wrx test` (u=owner,
  g=group, o=other, w=write, r=read, x=execute)
- The other way is to use numerical values like `chmod 640 test`

We leave two small topics as a bonus. We didn't explain how to set the owner or
group of a file. If you are interested, look for the `chown` command using a
search engine of your choice or the **man page**. Do you still remember what it
is? If not, we invite you to read our Terminal Basics posts. Also, we didn't
explain how to create a group and add users to it. Here the keyword you can
search for is `groupadd`. However, we probably won't need these commands in our
upcoming posts.

Yay! Done! This post completes our Linux basics series. The next post starts
with the basics of programming. Hope to see you soon and don't forget to follow
us on [Twitter](https://twitter.com/bitsandvolts)!
