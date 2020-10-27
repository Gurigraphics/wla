@echo off

wla-65816 -o main.obj main.asm
wlalink main.link main.smc 

del main.obj
 