# thinfilmSSA
Estimates the specific surface area of layered thin-film materials imaged by SEM (Matlab 2018b & later).

This project additionally requires the edgelinking library produced by Peter Kovesi available here: https://www.peterkovesi.com/matlabfns/index.html#edgelink
The library must be added to the Matlab path.

The only functions that must be directly interacted with are findSSA and findSSAsingle. findSSA is optimised to work with the QUT Zeiss SEM .tif tag formatting, and allows for the automated processing of any number of files fitting said format in a folder. findSSAsingle is designed to work on single images that may not fit this format - for example .png or .jpg images that do not have the required image metadata tags.

These files were produced through the scholarship funding provided by QUT.

M. Horn & F. Williams
