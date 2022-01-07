import("stdfaust.lib");

v = 2 * ma.PI * hslider("freq", 100, 20, 5000, 1) / ma.SR;
F1 = * (v / (1+v)) : + ~ * (1 / (1+v));
stage = (_ <: F1, ^(3)), _
        : (_ <: _, (^(3) : *(-1))), +
        : _, (+ :_: F1);

full = stage : stage : stage : stage;
process = full;