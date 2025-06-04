# Nes Template
This is a Template NES project, containing all you need to start your own project set up for visual studio code.
Made in connection to: "Game Development in 6502 assembly" by Viktor Mendonck

## Tools & Environment Setup
There are several tools in use developed specifically for this project.

### Build Process
The project is built through scripts calling cc65 in `scripts/`. This includes tests, assembling, and linking. All variables in the build process should be controlled through the `.env` file in the project root.

### Nestest
This is a unit testing framework developed for NES development. More information can be found on the [Nestest's Repository](https://github.com/Akadeax/nestest). 
<br><br>
there are VS code tasks set up for testing the project manually and there is a basic test set up in "src/tests/tests.s"
<br><br>
This project has VSCode tasks and git hooks setup for this project to run tests before commits. To setup hooks, use `git config core.hooksPath .hooks`.


## Credit
Special thanks to ["Patrick Nellessen"](https://github.com/Akadeax/) for helping with the tools and base project

 # License
 This is public domain, [Unlicense](https://unlicense.org/) specifically. Whether you wish to use it, contribute, fork, or redestribute; feel free to do so.