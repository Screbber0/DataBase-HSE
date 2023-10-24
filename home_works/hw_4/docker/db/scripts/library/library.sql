CREATE TABLE "book" (
  "isbn" varchar PRIMARY KEY,
  "category_id" int,
  "year" int,
  "title" varchar,
  "author" varchar,
  "page_count" int,
  "publisher_id" int
);

CREATE TABLE "category" (
  "category_id" int PRIMARY KEY,
  "name" varchar,
  "parent_category_id" int
);

CREATE TABLE "book_category" (
  "isbn" varchar,
  "category_id" int
);

CREATE TABLE "copy" (
  "isbn" varchar,
  "copy_number" int PRIMARY KEY,
  "location" varchar
);

CREATE TABLE "publisher" (
  "publisher_id" int PRIMARY KEY,
  "name" varchar,
  "address" varchar
);

CREATE TABLE "reader" (
  "reader_id" int PRIMARY KEY,
  "last_name" varchar,
  "first_name" varchar,
  "address" varchar,
  "birth_date" date
);

CREATE TABLE "borrowed_book" (
  "borrow_id" int,
  "isbn" varchar,
  "copy_number" int,
  "reader_id" int,
  "planned_return_date" date,
  PRIMARY KEY ("borrow_id", "isbn")
);

ALTER TABLE "book" ADD FOREIGN KEY ("publisher_id") REFERENCES "publisher" ("publisher_id");

ALTER TABLE "category" ADD FOREIGN KEY ("parent_category_id") REFERENCES "category" ("category_id");

ALTER TABLE "book_category" ADD FOREIGN KEY ("isbn") REFERENCES "book" ("isbn");

ALTER TABLE "book_category" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("category_id");

ALTER TABLE "copy" ADD FOREIGN KEY ("isbn") REFERENCES "book" ("isbn");

ALTER TABLE "borrowed_book" ADD FOREIGN KEY ("copy_number") REFERENCES "copy" ("copy_number");

ALTER TABLE "borrowed_book" ADD FOREIGN KEY ("reader_id") REFERENCES "reader" ("reader_id");
