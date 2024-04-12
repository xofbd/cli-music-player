# Command Line Interface Music Player
A collection of command line interface scripts to play music files.

## How it works
These scripts rely on the music files being organized in directories by artist and further divided by album.

## Prerequisites
Make sure you have the following installed:
* [fdfind](https://docs.rs/crate/fd-find/latest)
* [mplayer](http://www.mplayerhq.hu/design7/news.html)

Both of these are commonly available in most Linux distros' official repositories.

## Usage
There are four scripts that pretty much do what you expect:
1. `list-albums`
1. `list-songs`
1. `play-album`
1. `play-song`

Use `-h` or `--help` for usage info.

## Install
To create a standalone scripts, run `make all`

## License
This project is distributed under the GPL license. Please see `COPYING` for more information.
