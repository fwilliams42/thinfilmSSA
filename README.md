# thinfilmSSA
Estimates the specific surface area of layered thin-film materials imaged by SEM (Matlab 2018b & later).

This project additionally requires the edgelinking library produced by Peter Kovesi available here: https://www.peterkovesi.com/matlabfns/index.html#edgelink
The library must be added to the Matlab path.

The functions that may be called are findSSA and/or findSSAsingle. The function findSSA is optimized to work with Zeiss Sigma scanning electron microscope .tif tag formatting, and allows for the automated processing of any number of files fitting this format, contained in a file folder. The findSSAsingle function is designed to work on single images without an image ribbon and that may not fit the .tif file format - for example .png or .jpg images that do not have the image metadata tags (but that have a known pixels/metre scale).

This implementation was achieved under the MATLAB license of Queensland University of Technology, Brisbane, Australia.

M. Horn & F. Williams

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3335408.svg)](https://doi.org/10.5281/zenodo.3335408)
