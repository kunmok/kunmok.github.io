---
title: "RTL for 128 GS/s ADC-Based SerDes Rx" 
weight: 2
#date: 2021-10-01
tags: ["RTL"]
author: ["Kunmo Kim and Sunjin Choi"]
description: "RTL used for the digital backend implementation of a 128 GS/s ADC-based SerDes Rx" 
summary: "RTL used for the digital backend implementation of a 128 GS/s ADC-based SerDes Rx" 
cover:
    image: "snapshot.png"
    alt: "Verdi waveform dump"
    relative: false
#editPost:
 #   URL: "https://doi.org/10.1073/pnas.1816454115"
 #   Text: "Other Journal Name"

---

##### Github Link:

https://github.com/kunmok/digital_backend_for_128GSPS_ADC

This repository contains a collection of SystemVerilog RTL files for the digital backend implementation of a 128 GS/s ADC-based SerDes receiver.

This work is a collaboration between Sunjin and me — we jointly developed the digital backend and DSP architecture, while Sunjin carried out the full RTL implementation and place-and-route (P&R).

Unfortunately, we had to remove certain SDC constraint files and Hammer setup scripts because they contained sensitive PDK information. As a result, the version available in this repository is not the complete version used for tapeout. Nevertheless, it still provides sufficient detail to understand the overall architecture, retiming strategy, memory implementation, and the nonlinear feed-forward equalizer we developed.

We are also preparing a separate paper that discusses the detailed theory and operation of the nonlinear equalizer — referred to as the pattern-detection MLSE — which will be submitted to an IEEE journal in the near future. Stay tuned !!! 

---
