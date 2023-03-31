SUMMARY = "Simple app to recreate panic abort vs unwind issues."
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=68966b72df18cfc64ef755e89591eadf"

inherit cargo

SRC_URI += " \
    file://Cargo.toml \
    file://src/main.rs \
    file://LICENSE \
    "

S = "${WORKDIR}"
