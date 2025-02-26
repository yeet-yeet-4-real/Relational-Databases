CREATE TABLE "planet" (
  "planet_id" integer PRIMARY KEY,
  "name" varchar UNIQUE,
  "star_id" integer,
  "galaxy_id" integer,
  "planet_types_id" integer,
  "has_life" bool,
  "distance_from_earth" numeric,
  "description" text
);

CREATE TABLE "star" (
  "star_id" integer PRIMARY KEY,
  "name" varchar UNIQUE,
  "galaxy_id" integer,
  "description" text,
  "age_in_millions_of_years" integer
);

CREATE TABLE "moon" (
  "moon_id" integer PRIMARY KEY,
  "name" varchar UNIQUE,
  "planet_id" integer,
  "is_spherical" bool,
  "description" text
);

CREATE TABLE "galaxy" (
  "galaxy_id" integer PRIMARY KEY,
  "name" varchar UNIQUE,
  "galaxy_types_id" integer,
  "description" text
);

CREATE TABLE "galaxy_types" (
  "galaxy_types_id" integer PRIMARY KEY,
  "name" varchar UNIQUE,
  "description" text
);

CREATE TABLE "planet_types" (
  "planet_types_id" integer PRIMARY KEY,
  "name" varchar UNIQUE,
  "description" text
);

ALTER TABLE "moon" ADD FOREIGN KEY ("planet_id") REFERENCES "planet" ("planet_id");

ALTER TABLE "star" ADD FOREIGN KEY ("galaxy_id") REFERENCES "galaxy" ("galaxy_id");

ALTER TABLE "planet" ADD FOREIGN KEY ("star_id") REFERENCES "star" ("star_id");

ALTER TABLE "galaxy" ADD FOREIGN KEY ("galaxy_types_id") REFERENCES "galaxy_types" ("galaxy_types_id");

ALTER TABLE "planet" ADD FOREIGN KEY ("planet_types_id") REFERENCES "planet_types" ("planet_types_id");

ALTER TABLE "planet" ADD FOREIGN KEY ("galaxy_id") REFERENCES "galaxy" ("galaxy_id");
