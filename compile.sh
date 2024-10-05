#!/bin/bash
set -e

JPRE_COMPILE_PWD=`pwd`
cd `dirname $0`

mkdir -p ./priv;

rm -f priv/libbcrypte.so;
cargo build --manifest-path=crates/bcrypte/Cargo.toml --release;
mv crates/bcrypte/target/release/libbcrypte.so priv/.;


cd $JPRE_COMPILE_PWD
