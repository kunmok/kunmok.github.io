---
title: "XEM7310 FPGA Breakout Board" 
weight: 3
#date: 2021-10-01
tags: ["PCB"]
author: ["Kunmo Kim"]
description: "Breakout / interface board for the Opal Kelly XEM7310 FPGA module used to test the 128 GS/s ADC-based SerDes Rx" 
summary: "4-layer breakout board for the Opal Kelly XEM7310, bridging the FPGA to the 128 GS/s ADC-based SerDes Rx over a Samtec FFSD cable" 
cover:
    image: "fpga_breakout.png"
    alt: "XEM7310 FPGA breakout board (v0.5)"
    relative: false
#editPost:
 #   URL: "https://doi.org/10.1073/pnas.1816454115"
 #   Text: "Other Journal Name"

---

##### Github Link:

https://github.com/kunmok/PCB_for_FPGA

This is a custom breakout board I designed for the [Opal Kelly XEM7310](https://opalkelly.com/products/xem7310/) FPGA module. It bridges the FPGA to my 128 GS/s ADC-based SerDes receiver chip, fanning the FPGA's scan-chain, analog, and digital signals out to the [main test board](https://github.com/kunmok/pcb-for-128GSPS-adc-based-serdes) over a Samtec FFSD ribbon cable.

The board generates the FPGA bank I/O supplies locally (1.2 V LVCMOS12 for one bank, 3.3 V LVCMOS33 for the other), level-shifts the power-good flag and the clock-test scan chain, and breaks out SMA clock/data probes, a JTAG header for in-system ILA debug, and an I²C interface. You can find the full schematic, fabrication drawings, and bill of materials (BOM) through the link.

This 4-layer board was fabricated and assembled by JLCPCB.

---
