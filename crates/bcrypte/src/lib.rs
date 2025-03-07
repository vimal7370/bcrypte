extern crate rustler;
extern crate bcrypt;
use bcrypt::{DEFAULT_COST, hash, verify};

rustler::init!("bcrypte");

#[rustler::nif(schedule = "DirtyCpu")]
fn hash_1(password: String) -> String {
    hash(password, DEFAULT_COST).unwrap().to_string()
}

#[rustler::nif(schedule = "DirtyCpu")]
fn hash_2(password: String, cost: u32) -> String {
    hash(password, cost).unwrap().to_string()
}

#[rustler::nif(schedule = "DirtyCpu")]
fn verify_2(password: String, hash: String) -> bool {
    match verify(password, &hash) {
        Ok(true) => true,
        Ok(false) => false,
        _ => false,
    }
}

