-- Opener -- Free Science per city, additional per policy taken. Closer grants 33% boost to GS, 25% boost to Growth.

UPDATE Policies
SET HappinessToScience = '0'
WHERE Type = 'POLICY_RATIONALISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET GoldenAgeTurns = '10'
WHERE Type = 'POLICY_RATIONALISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET HappinessToScience = '5'
WHERE Type = 'POLICY_RATIONALISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Humanism (now Enlightenment) -- boost when happy
UPDATE Policies
SET HappinessToScience = '1'
WHERE Type = 'POLICY_HUMANISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET GreatScientistRateModifier = '0'
WHERE Type = 'POLICY_HUMANISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Scientific Revolution
UPDATE Policies
SET OneShot = '0'
WHERE Type = 'POLICY_SCIENTIFIC_REVOLUTION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET HappinessToScience = '1'
WHERE Type = 'POLICY_SCIENTIFIC_REVOLUTION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET MedianTechPercentChange = '0'
WHERE Type = 'POLICY_SCIENTIFIC_REVOLUTION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );


-- Secularism
DELETE FROM Policy_SpecialistExtraYields
WHERE PolicyType = 'POLICY_SECULARISM';

UPDATE Policies
SET MonopolyModFlat = '2'
WHERE Type = 'POLICY_SECULARISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET MonopolyModPercent = '10'
WHERE Type = 'POLICY_SECULARISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET HappinessToScience = '1'
WHERE Type = 'POLICY_SECULARISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Sovereignty
DELETE FROM Policy_BuildingClassYieldChanges
WHERE PolicyType = 'POLICY_SOVEREIGNTY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET HappinessToScience = '1'
WHERE Type = 'POLICY_SOVEREIGNTY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET HappinessPerTradeRoute = '0'
WHERE Type = 'POLICY_SOVEREIGNTY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET ExtraHappiness = '0'
WHERE Type = 'POLICY_SOVEREIGNTY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );


-- Free Thought
DELETE FROM Policy_BuildingClassYieldModifiers
WHERE PolicyType = 'POLICY_FREE_THOUGHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET HappinessToScience = '1'
WHERE Type = 'POLICY_FREE_THOUGHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policy_ImprovementYieldChanges
SET Yield = '2'
WHERE PolicyType = 'POLICY_FREE_THOUGHT' AND YieldType = 'YIELD_SCIENCE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET MinorityHappinessMod = '-100'
WHERE Type = 'POLICY_FREE_THOUGHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Finisher
UPDATE Policies
SET GreatScientistRateModifier = '33'
WHERE Type = 'POLICY_RATIONALISM_FINISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET CityGrowthMod = '25'
WHERE Type = 'POLICY_RATIONALISM_FINISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET OneShot = '0'
WHERE Type = 'POLICY_RATIONALISM_FINISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET NumFreeTechs = '0'
WHERE Type = 'POLICY_RATIONALISM_FINISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Finisher
UPDATE Policies
SET IdeologyPoint = '1'
WHERE Type = 'POLICY_RATIONALISM_FINISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- NEW

INSERT INTO Policy_GoldenAgeYieldMod
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_HUMANISM', 'YIELD_SCIENCE', 10),
	('POLICY_HUMANISM', 'YIELD_FOOD', 10);

INSERT INTO Policy_ResourceYieldChanges
	(PolicyType, ResourceType, YieldType, Yield)
VALUES
	('POLICY_SOVEREIGNTY', 'RESOURCE_IRON', 'YIELD_SCIENCE', 3),
	('POLICY_SOVEREIGNTY', 'RESOURCE_IRON', 'YIELD_PRODUCTION', 2),
	('POLICY_SOVEREIGNTY', 'RESOURCE_HORSE', 'YIELD_SCIENCE', 3),
	('POLICY_SOVEREIGNTY', 'RESOURCE_HORSE', 'YIELD_PRODUCTION', 2),
	('POLICY_SOVEREIGNTY', 'RESOURCE_COAL', 'YIELD_SCIENCE', 3),
	('POLICY_SOVEREIGNTY', 'RESOURCE_COAL', 'YIELD_PRODUCTION', 2),
	('POLICY_SOVEREIGNTY', 'RESOURCE_OIL', 'YIELD_SCIENCE', 3),
	('POLICY_SOVEREIGNTY', 'RESOURCE_OIL', 'YIELD_PRODUCTION', 2),
	('POLICY_SOVEREIGNTY', 'RESOURCE_ALUMINUM', 'YIELD_SCIENCE', 3),
	('POLICY_SOVEREIGNTY', 'RESOURCE_ALUMINUM', 'YIELD_PRODUCTION', 2),
	('POLICY_SOVEREIGNTY', 'RESOURCE_URANIUM', 'YIELD_SCIENCE', 3),
	('POLICY_SOVEREIGNTY', 'RESOURCE_URANIUM', 'YIELD_PRODUCTION', 2);

INSERT INTO Policy_SpecialistExtraYields
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_SCIENTIFIC_REVOLUTION', 'YIELD_SCIENCE', 1),
	('POLICY_SCIENTIFIC_REVOLUTION', 'YIELD_GOLD', 1);

INSERT INTO Policy_ImprovementYieldChanges
	(PolicyType, ImprovementType, YieldType, Yield)
VALUES
	('POLICY_FREE_THOUGHT', 'IMPROVEMENT_TRADING_POST', 'YIELD_CULTURE', 2);