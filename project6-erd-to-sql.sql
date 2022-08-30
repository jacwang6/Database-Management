/*
 *  project6.sql
 * 
 *  author: Jacky Wang
 *  collaborated: Jordan Tehranchi
 */


-- Note you can also do single-line comments this way
/* Comments */

/* Clear all the tables if any exist previously */
DROP TABLE IF EXISTS reviewer;
DROP TABLE IF EXISTS business;
DROP TABLE IF EXISTS chain;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS business_reviewer_xref;
DROP TABLE IF EXISTS business_type;

/* Reviewer Table */

CREATE TABLE reviewer(screen_name TEXT, identity_provider TEST, CONSTRAINT identity PRIMARY KEY(screen_name, identity_provider));

/* Business Table */

CREATE TABLE business(name TEXT, ID SERIAL PRIMARY KEY, street_address TEXT, city TEXT, state TEXT, zip TEXT, chain_name TEXT, 
FOREIGN KEY (chain_name) REFERENCES chain(name));

/* Chain Table */

CREATE TABLE chain(name TEXT PRIMARY KEY, city TEXT, state TEXT);


/* Menu Table */

CREATE TABLE menu(url TEXT, business_ID SERIAL, menu_label TEXT, 
PRIMARY KEY (business_ID, menu_label), 
FOREIGN KEY (business_ID) REFERENCES business(ID));


/* Business and Reviewer XREF Table */

CREATE TABLE business_reviewer_xref(reviewer_screen_name TEXT, reviewer-identity-provider TEXT, business_ID TEXT, views INTEGER, rating INTEGER, review_date DATE, comments TEXT, 
PRIMARY KEY (reviewer_screen_name, reviewer-identity-provider, business_ID), 
FOREIGN KEY (reviewer_screen_name, reviewer-identity-provider) REFERENCES reviewer(screen_name, identity-provider), 
FOREIGN KEY (business_ID) REFERENCES business(ID));


/* Business Type Table (Multivalued Attribute) */

CREATE TABLE business_type(business_ID SERIAL, type TEXT, 
PRIMARY KEY (business_ID, type), FOREIGN KEY (business_ID) REFERENCES business(ID));




















































