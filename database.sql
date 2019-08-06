How do you get all users from Chicago?
SELECT * FROM "accounts" WHERE "city" = 'chicago';

How do you get all users with usernames that contain the letter a?
SELECT * FROM "accounts" WHERE "username" ILIKE '%a%';

The bank is giving a new customer bonus! How do you update all records with an account balance of 0.00 and a transactions_attempted of 0? Give them a new account balance of 10.00.
UPDATE "accounts"
SET "account_balance" = 10.00
WHERE "transactions_attempted" = 0 AND "account_balance" = 0;

How do you select all users that have attempted 9 or more transactions?
SELECT * FROM "accounts" WHERE "transactions_attempted" >= 9;

How do you get the username and account balance of the 3 users with the highest balances, sorted highest to lowest balance? NOTE: Research LIMIT
SELECT "username", "account_balance" FROM "accounts" 
ORDER BY "account_balance" DESC LIMIT 3;

How do you get the username and account balance of the 3 users with the lowest balances, sorted lowest to highest balance?
SELECT "username", "account_balance" FROM "accounts" 
ORDER BY "account_balance" ASC -- ASC is the default, so not necessary here
LIMIT 3;

How do you get all users with account balances that are more than $100?
SELECT * FROM "accounts" WHERE "account_balance" > 100;

How do you add a new account?
INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance) VALUES -- (insert account attributes here)
;

The bank is losing money in Miami and Phoenix and needs to unload low transaction customers: How do you delete users that reside in miami OR phoenix and have completed fewer than 5 transactions.
DELETE FROM "accounts" WHERE ("city" = 'miami' OR "city" = 'phoenix') AND "transactions_completed" < 5;

Anthony moved to Santa Fe.
UPDATE "accounts" SET "city" = 'santa fe' WHERE "username" = 'anthony';

Grace closed her account.
DELETE FROM "accounts" WHERE "username" = 'grace';

Travis made a withdrawl of $20,000. What's their new balance? NOTE: Research RETURNING
SELECT ("account_balance" - 20000) FROM "accounts" WHERE "username" = 'travis'; -- this is a theoretical and does not change anything, so...
UPDATE "accounts" SET "account_balance" = ("account_balance" - 20000) WHERE "username" = 'travis'
RETURNING "account_balance";

The Bank needs to track last names. NOTE: Research ALTER TABLE 
ALTER TABLE accounts * 
ADD COLUMN last_name varchar(24);
UPDATE "accounts" SET "last_name" = 'mendes' WHERE "username" = 'shawn';

