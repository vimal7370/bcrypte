#!/bin/bash
set -e

JPRE_COMPILE_PWD=`pwd`
cd `dirname $0`

mkdir -p ./priv;

rm -f priv/*;
cargo build --manifest-path=crates/bcrypte/Cargo.toml --release;
[ -f "crates/bcrypte/target/release/libbcrypte.so" ] &&mv crates/bcrypte/target/release/libbcrypte.so priv/.;
[ -f "crates/bcrypte/target/release/libbcrypte.dylib" ] &&mv crates/bcrypte/target/release/libbcrypte.dylib priv/.;

cd $JPRE_COMPILE_PWD
