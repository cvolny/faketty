# FakeTTY

Example LD_PRELOAD so for faking calls to isatty(). Example bash script provided
to show that `[[ -t fd ]]` tests are beaten with this.

Run test without LD_PRELOAD:

`make testneg`

Run test using LD_PRELOAD to use our version of `int isatty(int)`: 

`make test`
