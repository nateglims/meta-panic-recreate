# meta-panic

This layer is for reproducing an issue when compiling `panic = abort` rust crates.

Notable settings:
* `TCLIBC = 'musl'` causes the build to pass.
* MACHINE does not seem to impact it.


