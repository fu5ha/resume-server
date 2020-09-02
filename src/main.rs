#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

use rocket::response::{NamedFile, Redirect};

use std::io::Result as IoResult;

#[get("/")]
fn root() -> Redirect {
    Redirect::to("/graphics")
}

#[get("/graphics")]
fn graphics() -> IoResult<NamedFile> {
    NamedFile::open("assets/GrayOlson_graphics.pdf")
}

#[get("/art")]
fn art() -> IoResult<NamedFile> {
    NamedFile::open("assets/GrayOlson_art.pdf")
}

fn main() {
    rocket::ignite().mount("/", routes![root, graphics, art]).launch();
}
