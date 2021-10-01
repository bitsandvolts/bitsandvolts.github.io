---
layout: single
title: Basic Shell Scripts
category: Getting Started
permalink: /categories/getting_started/basic_shell_scripts
excerpt: "Automate repeating tasks"
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

<div class='note-normal'>
<top4>Prerequisites</top4>
<ul>
    <li><a href="/categories/getting_started/terminal_basics">Terminal Basics I</a></li>
    <li><a href="/categories/getting_started/terminal_basics2">Terminal Basics II</a></li>
</ul>
</div>

We are glad you made it back to our next post! Is your head ready to learn a
very cool thing called **shell scripts**? Let's go...

In our very first post, we stated that using a terminal has many advantages over
a graphical interface. To convince you, we introduced very basic but powerful
commands that you can use to control your computer with a terminal. If you have
no idea what a terminal is or if you forgot some commands, just use one of the
two links above to go back to the previous posts. Even though things like the
autocompletion and the "\*" operator are reason enough for us to use the
terminal, this might not convince everyone. So, we want to go one step further.
Are you ready?

# Ideology

<div style="overflow: auto;" markdown="1">
<figure class="img-right">
  <img src="/assets/images/gs_00004_josephine.jpg" alt="">
</figure>

Let's do some time traveling into the year 1886. There was a woman called
Josephine. She loved to celebrate parties. There was just one issue with that.
She hated to clean the dishes afterward. So, she tried to build a machine to do
it automatically for her. Finally, she was the first person in the world to
construct a working dishwasher.

Even though we do not expect you to invent something so meaningful as a
dishwasher, the idea behind the concept should come to your mind very often.
Whenever you have to do something _regularly_ you should ask yourself if it is
possible to _automate_ it. This is more or less what a **script** does. It calls
a sequence of commands for you. We want to give you two examples that might be
useful in the real world. Before that, we have to clarify the term **shell**.

Basically, it is a program that **interprets** your commands. Whenever you enter
some text into the terminal, the shell _understands_ what you want and executes
your command. So, when we refer to a **shell script**, we mean a script that is
run by a shell of your Linux machine. There are also other scripts such as a
**Python** script, that we will cover in future posts. One commonly used shell,
that we also used in previous posts, is called **bash**. If you are interested
in more details, you are invited to read the bonus chapter at the end of this
post, in which we try to explain the difference between terminal, console, and
shell.

</div>

# Your first Bash Script

The typical morning of a software developer is often very similar. You go to
work, get your first coffee and then open all required software for your job:
Email client, meeting software, browser, music app, and so on. Probably it might
be different depending on your daily work schedule. Wouldn't it be cool that at
least the software opening part is done automatically? Let's take it as an
example for the first script that shall open a browser. You already know how to
do it with a terminal command, don't you? If not, we will show it again shortly.
To write your first script, open a new file:

    $ nano open_firefox.sh

<div class='note-normal' markdown="1">
_Note: '.sh' is the typical file extension for shell scripts_.
</div>

Enter the following text:

    #!/bin/bash

    # Print something to the terminal
    echo "Greetings from Bits&Volts (bitsandvolts.org)"

    # Open firefox
    firefox &

Press CTRL-X to close and 'y' (yes) to save the file. Before we run it, let's
talk about the content. The first line starting with the '#!' tells by what
program (shell) the script shall be interpreted. In our case, we want to use
**bash**. What does the 'bin' mean? The **bin** folder is a common folder where
software programs such as the bash shell are installed. So, '/bin/bash/' is
nothing but the absolute path of the shell program. The third line starting with
'#' is just a comment that is not interpreted. If you write complex scripts, it
is helpful to put some comments, so that someone else can better understand it.
'echo' is a command that we did not cover yet. It simply outputs some text.
Then, we have another comment and the command to open firefox you already know.
Note that we have to use the '&' here, as explained in our last post (it means
that the program will be started in the background).

Try to run the script as you would run a program:

    $ open_firefox.sh

This will not work as the command cannot be found. To understand why, we have to
look a bit deeper into what happens if you run a program. Clearly, the program
has to be stored somewhere. But how can your operating system know where? The
answer is: It can't! It only can look into all your files and folders and search
for them. However, you can imagine that this can take a while, especially for
large systems. This is why there are predefined folders where the programs have
to be. As we mentioned earlier, that '/bin' is, per default, such a folder. In
general, there are three options for scripts:

1. Move the script to a folder where it can be found. We do not want to do it
   here as it is not always practical in real-life situations.
2. Add your current folder to the so-called **PATH** variable. This variable
   holds the predefined folders we mentioned above. We explain in a later post
   how to do it. However, it is also not always a good solution. If you add too
   many folders it will take long to execute a command.
3. Run the program by its absolute path.

The last option is always an easy solution and we want to use it now:

```
$ ./open_firefox.sh
bash: ./open_firefox.sh: Permission denied
```

Ups... Still does not work. But how can it be that the permission is denied? You
created the file yourself in a folder that belongs to your home folder. What can
be missing? We talk about access rights in more detail in our next posts. For
now, we just tell you that you have the permission to read and write the file.
However, to run your script, you need the permission to _execute_ the file. We
can add it using:

    $ chmod +x open_firefox.sh

We promise to explain this soon. Just use the command for now. Try again to
execute the script. This time your firefox browser and a message in the terminal
should appear. Opening a browser is only half of the story. You probably want to
open several tabs. Let's do it by replacing 'firefox &' with the following
command:

    firefox -new-tab -url bitsandvolts.org \
            -new-tab -url https://github.com/bitsandvolts/getting_started &

<div class='note-normal' markdown="1">
_Note: For better readability, we split the command over two lines using '\\'. You can also write it into one line without '\\'_.
</div>

Save the script and run it again:

    $ ./open_firefox.sh

A tab to our blog and a tab to the git repository should be opened.

<div class='note-exercise' markdown="1">
Exercise:

Can you imagine another program you want to run for your daily work?

</div>

# A second example

Congratulations! You just ran your first script! Good job! Now we want to give
you a second example and explain two more interesting features of bash scripts.
Imagine you are working in a company with multiple projects. We often experience
that every employee organizes the projects he or she is responsible for in
his/her own way. This, however, has a huge drawback. If there is a new
colleague, he/she has to find his/her own way. Moreover, if you take over the
project from a colleague you have to spend time to understand his/her project
organization. A better way would be to have a project template that everyone
uses. Let's create a very basic one!

First, you usually would create a folder with the project name. Then, inside
this folder, you might have a folder for the project sources and one for the
documentation. Additionally, there might be a **README** and a **LICENSE** file.
In the REAMDE you usually put basic information. For example, how you can
install the software or how your project is organized. The LICENSE file is
important if you want to publish your project. It tells others how they are
allowed to use it.

<div class='note-exercise' markdown="1">
Exercise:

Check our [GitHub repository](https://github.com/bitsandvolts/getting_started)
and find an example for a README and a LICENSE file.

</div>

From the previous posts and the first bash script above, you should already know
how to create the necessary folders and files. Use 'nano' to open a file
'project_template.sh' and enter the following:

    #!/bin/bash

    # Print something to the terminal
    echo "Greetings from Bits&Volts (bitsandvolts.org)"

    # Create the project folder
    mkdir my_project

    # move into the project folder
    cd my_project

    # create other folders and files
    mkdir sources
    mkdir documentation
    touch README.md
    touch LICENSE

<div class='note-normal' markdown="1">
_Note: '.md' is a Markdown extension, which is typical for a README. We will talk about it in a future post._
</div>

Save the file, add the correct privileges and run it:

    $ chmod +x project_template.sh
    $ ./project_template.sh

If you list your directory contents, you should see the created project:

    $ ls

So far, so good! However, not all projects are called 'my_project' and it would
be inconvenient to always change the script, whenever you want to create a new
project. That's why we want to introduce you to something called **arguments**.
If you call your script you can give it additional parameters (arguments) that
are used by the script. In particular, we want to call our script like this:

    $ ./project_template.sh project_name

Before we can do it, we have to make a tiny change. Within the script, such
arguments can be accessed with a
<span>$</span>-sign and a number. <span>$</span>1 would be the first argument,
<span>$</span>2 the second, and so on. In our script, we need to change the
following lines (the other lines can be left as they are):

    # Create the project folder
    mkdir $1

    # move into the project folder
    cd $1

Easy, isn't it? Now try to call the script and a new folder called
'project_name' should appear:

    $ ./project_template.sh project_name

<div class='note-exercise' markdown="1">
Exercise:

In general,
<span>$</span>0 holds the name of the script. Add a line to the script printing
the script name using echo and <span>$</span>0.
Run the script using:

    $ ./project_template.sh hello

</div>

<div class='note-normal' markdown="1">
_Note: We always use different project names whenever we run the script. What would happen if you create a project that already exists? Probably, the user should get a warning and the creation should be aborted. We will avoid this situation for now and cover such a check in a future post. Also, we should check that the user really entered an argument. Calling the script with no or more than one argument should fail as well._
</div>

There is one last, but very important aspect. Inside the script, we used a 'cd'
command, so we should be inside the project folder after our script has run.
However, as you used 'ls' before, you might have noticed that this is not the
case. You are still where you were before you started the script. The reason is
the following: If you run the script it is not run in your _current_ shell.
Internally, a _new_ shell is opened which executes the commands in our script.
The shell is then automatically closed at the end of the script. So, the 'cd'
has no impact on your current shell. Sometimes, however, you want to change your
current working directory automatically. For your project template, it might be
useful to directly move into the project folder. If you want to do so, you have
to **source** the script. In this way, the _current_ shell itself will be used
to execute the script:

    $ source ./project_template.sh i_am_a_project

Verify that you moved inside the project folder:

    $ pwd

# Summary

Yaaay! Your first scripts are running. Doesn't that feel cool? Let's try to
summarize what we learned in this post. As always, you can find the two example
scripts in our
[GitHub repository](https://github.com/bitsandvolts/getting_started) of the
"Getting Started" category.

- A **script** can execute multiple commands for you
- A **shell** interprets your commands
- **Bash** is a commonly-used shell
- At the beginning of a script, you usually tell what program shall interpret
  the script (`#!/bin/bash`)
- Programs have to be located in defined folders to be found
- As an alternative, you can run it by its **absolute path**
- A script needs the execution **privilege** (`chmod +x name`)
- Script **arguments** can be accessed by `$1`, `$2`, ...
- **Source** a script to let it take effect on your current shell

In the next post, we will talk about **privileges** and so-called **environment
variables**! Stay tuned, and don't forget to follow us on
[Twitter](https://twitter.com/bitsandvolts)! If you cannot wait to learn more,
be our guest in the following bonus section.

# Shell, Terminal, Console ... (Bonus)

In this post, we have introduced you to the shell. Sometimes though, you might
hear terms like "terminal", or "console". All these terms are very confusing for
beginners as well as advanced engineers. Regularly, they are used
interchangeably. Let's try to make them as clear as possible. In the very
beginning, computers were huge and usually had no user interface. You needed
some extra **physical device** that was connected to the computer, which was
called **console**. Nowadays, you typically do not need an extra physical device
to control your computer. You might get a feeling why the terms are a bit
confusing. The original situation simply changed.

In contrast to the console, the **terminal** is not something physical. It is
simply a text input and output environment. So far, so good. You have a physical
device (console) with a keyboard or something similar and kind of a program
where you can type some text in (terminal). But there is one step more.
Something needs to read the text you are typing and **interpret** its meaning.
The software that is doing this task is called **shell**. If you enter a command
like 'ls', the shell _understands_ that you want to get the content of the
current folder. It executes the command and returns the output to the terminal.

As you can have different physical devices, you can also have different
terminals and shells. A different terminal might look different from another
one. A different shell might interpret different commands. Wait ... What? Yeah,
you heard correctly! Commands that work in one shell might work differently or
not at all in another. But don't worry! Just have it in mind for now! By the
way, the shell we used in the previous posts is called **bash**. We might talk
about other shells in future posts, but for now, we stay with this commonly used
shell.
