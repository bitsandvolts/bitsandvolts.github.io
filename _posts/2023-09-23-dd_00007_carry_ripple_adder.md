---
layout: single
title: The Carry-Ripple Adder
category: Digital Design
permalink: /categories/digital_design/carry_ripple_adder
excerpt: "How computers add numbers."
description:
  "This post introduces the Carry-Ripple Adder, the most basic circuit to add two binary numbers."
author: Kirthihan Yasotharan
toc: false
toc_label: "Content"
toc_sticky: true
toc_icon: "align-justify"
header:
  overlay_color: "#000"
  overlay_filter: "0.5"
  overlay_image: /assets/images/digital_design.jpeg
---

<div markdown='1' class='note-normal'>
## TLDR

- The **Carry Ripple Adder** (CRA) is the most basic adder circuit
- The CRA is made up of a chain of **Full-Adders** (FA)
- In the **worst case**, the carry has to ripple through all FAs
- This worst case delay is also known as the **propagation delay** of the CRA
</div>

----

Now that we've learned the basics of the [Full-Adder](/categories/digital_design/full_adder), it's finally time to build our first adder circuit, the **Carry-Ripple Adder**, or short, **CRA**. Before we get to the hardware, let us first refresh how binary addition works. Consider we are adding the numbers 42 and 27. Just as with decimal numbers, we can do the addition “on paper” like this:

<figure class="img-center" style="width:70%">
  <img src="/assets/images/dd-00007-addition-example.jpg" alt="Binary addition" title="Binary addition">
  <!-- <figcaption class="figure-caption text-center">Microchips</figcaption> -->
</figure>


Notice the small, red 1s. These are the _carry_ bits. As you can see, each sum bit is the addition of the two corresponding input bits and the carry bit resulting from adding the two _previous_ input bits (no carry simply means “0”). With this now in mind, let's look again at the circuit symbol of the Full-Adder:

<figure class="img-center" style="width:50%">
  <img src="/assets/images/dd-00006-full-adder-2.jpg" alt="Full Adder" title="Full Adder">
  <!-- <figcaption class="figure-caption text-center">Microchips</figcaption> -->
</figure>

Notice how the FA takes in a carry from the _right_, and produces a carry to the _left_. Just in the same way as the carry “flows” in the paper-addition above. So, why don't we just go ahead, an simply chain a bunch of FAs like this:

<figure class="img-center" style="width:100%">
  <img src="/assets/images/dd-00007-cra.jpg" alt="Carry Ripple Adder" title="Carry Ripple Adder">
  <!-- <figcaption class="figure-caption text-center">Microchips</figcaption> -->
</figure>

Aaand, there we have it: this is nothing but the promised Carry-Ripple Adder! With this particular one, we can add two 4-bit numbers. You might be asking: “What does the 'ripple' mean?” It indicates that the carry “ripples” through the FA chain from right to left. Remember, on paper, to get the correct sum we always have to start the addition from the right and go to the left. Therefore, also in hardware, the carry will start on the far right, and then move leftwards.

Now something important: Logic gates in reality have a **delay** associated with them. This simply means that the output will not appear immediately, it will always take a tiny amount of time[^1]. The situations worsens as we chain many logic gates: All the individual gate delays will be accumulated. The delay between the input and the output of any combinationinal circuit is also called **propagation delay**. The delay is critical when it comes to the important concept of **clocking** as it will determine the maximum speed our circuit can run at; but that's a topic we will cover in the upcoming posts.

So, each Full-Adder will have a delay (for both the Sum and the Cout bits). To see why the delay is important, let's look at an example where we are adding the two numbers 1111 and 0001:

<figure class="img-center" style="width:100%">
  <img src="/assets/images/dd-00007-cra2.jpg" alt="CRA extreme case" title="CRA extreme case">
  <!-- <figcaption class="figure-caption text-center">Microchips</figcaption> -->
</figure>

The right most FA produces a sum of 0 and a carry of 1. This will make the second FA also produce a sum of 0 again a carry of 1. This pattern repeats itself all the way until the last FA is reached. For simplicity, let's assume that each FA has a propagation delay of 1 second for its Cout. In our example, the Cout of the first (right-most) FA influenced all FAs down the chain until the last one. Now, with our imaginary delay of 1 second per carry out, the last FA would have to wait 3 seconds until the carry finally reaches it. If the FA didn't wait, then it would falsly produce a 1 at the sum, as it would still see a 0 at its Cin. So, in general, the worst case delay for the CRA is when the carry has to ripple through _all_ FAs in the chain (like in the example above). So, if you want to add large bit sizes, then you need to account for that CRA delay. This worst case delay is also what engineers take as the overall propagation delay of the CRA.

As many algorithms rely on the addition as the fundamental operation, a lot of effort has been put in designing advanced adder architectures where the propagation delay is significantly reduced compared to the CRA. Those types of adders we might cover in the future. For now, we hope you understood the basic principle of the Carry-Ripple Adder. See you next time!

----
[^1]: Like reeaallly tiny, but in such tiny circuits, it cat matter a LOT.























