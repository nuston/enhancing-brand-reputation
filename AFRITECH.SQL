CREATE TABLE AfriTech (CustomerID INT,
CustomerName TEXT,
Region TEXT,
Age INT,
Income NUMERIC (10,2),
CustomerType TEXT,
TransactionYear TEXT,
TransactionDate DATE,
ProductPurchased TEXT,
PurchaseAmount NUMERIC (10,2),
ProductRecalled BOOLEAN,
Competitor_x TEXT,
InteractionDate DATE,
Platform TEXT,
PostType TEXT,
EngagementLikes INT,
EngagementShares INT,
EngagementComments INT,
UserFollowers INT,
InfluencerScore INT,
BrandMention BOOLEAN,
CompetitorMention BOOLEAN,
Sentiment TEXT
);

ALTER TABLE AfriTech
ALTER COLUMN InfluencerScore 
TYPE NUMERIC (10,3)
USING InfluencerScore :: NUMERIC;

SELECT *
FROM AfriTech;

SELECT REGION
FROM AfriTech;

CREATE TABLE CustomerData (
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(50),
Region VARCHAR(50),
Age INT,
Income NUMERIC(10,2),
CustomerType VARCHAR(50)
);

SELECT *
FROM CustomerData;

INSERT INTO CustomerData(CustomerID,CustomerName,Region,Age,Income,CustomerType)
SELECT DISTINCT CustomerID,CustomerName,Region,Age,Income,CustomerType
FROM AfriTech;

CREATE TABLE Transaction (
TransactionID SERIAL PRIMARY KEY,
CustomerID INT,
TransactionYear VARCHAR (4),
TransactionDate DATE,
ProductPurchased TEXT,
PurchaseAmount NUMERIC (10,2),
ProductRecalled BOOLEAN,
InteractionDate DATE,
FOREIGN KEY(CustomerID) REFERENCES CustomerData(CustomerID)
);

INSERT INTO Transaction(CustomerID,TransactionYear,TransactionDate,ProductPurchased,PurchaseAmount,
ProductRecalled,InteractionDate)
SELECT CustomerID,TransactionYear,TransactionDate,ProductPurchased,PurchaseAmount,ProductRecalled,InteractionDate
FROM AfriTech
WHERE TransactionDate is NOT NULL;
SELECT *
FROM Transaction;

CREATE TABLE Social_media (
PostID SERIAL PRIMARY KEY,
CustomerID INT,
Platform TEXT,
PostType TEXT,
EngagementLikes INT,
EngagementShares INT,
EngagementComments INT,
UserFollowers INT,
InfluencerScore NUMERIC (10,3),
BrandMention BOOLEAN,
CompetitorMention BOOLEAN,
Sentiment TEXT,
FOREIGN KEY(CustomerID) REFERENCES CustomerData(CustomerID)
)
INSERT INTO Social_media(CustomerID,Platform,PostType,EngagementLikes,EngagementShares,
EngagementComments,UserFollowers,InfluencerScore,BrandMention,CompetitorMention,Sentiment)

SELECT CustomerID,Platform,PostType,EngagementLikes,EngagementShares,
EngagementComments,UserFollowers,InfluencerScore,BrandMention,CompetitorMention,Sentiment
FROM AfriTech

SELECT *
FROM Social_media;
