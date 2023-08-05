-- Drop if the table exists
DROP TABLE IF EXISTS PetShop;

-- Create the table with:
-- ID, Data type: Integer, Nullable: No
-- ANIMAL, Data type: VARCHAR, Nullable: Yes
-- SAlEPRICE, Data type: DECIMAL, Nullable: Yes, Length: 6, Scale: 2
-- SALEDATE, Data type: DATE, Nullable: Yes
-- QUANTITY, Data type: INTEGER, Nullable: Yes

CREATE TABLE PetShop (
    ID INTEGER NOT NULL,
    ANIMAL VARCHAR(20),
    SALEPRICE DECIMAL(6,2),
    SALEDATE DATE,
    QUANTITY INTEGER
);
