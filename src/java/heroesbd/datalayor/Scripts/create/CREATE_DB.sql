CREATE TABLE UNIVERSES(
ID_UNIVERSE INTEGER NOT NULL,
TITLE VARCHAR(20) NOT NULL,
FOUNDATION_YEAR SMALLINT,
TYPE VARCHAR(20),
PRIMARY KEY (ID_UNIVERSE)
);

CREATE TABLE HEROES(
ID_HERO INTEGER NOT NULL,
ID_UNIVERSE INTEGER NOT NULL,
AGE SMALLINT,
NAME VARCHAR(20) NOT NULL,
GENDER VARCHAR(10),
BODY_TYPE VARCHAR(15),
LOCATION VARCHAR(20),
PRIMARY KEY (ID_HERO)
);
ALTER TABLE HEROES add
    FOREIGN KEY (ID_UNIVERSE) REFERENCES UNIVERSES (ID_UNIVERSE);


CREATE TABLE ABILITIES(
ID_ABILITY INTEGER NOT NULL,
NAME VARCHAR(20) NOT NULL,
RESTRICTIONS VARCHAR(50),
PRIMARY KEY (ID_ABILITY)
);

CREATE TABLE HEROIC_ABILITIES(
ID_HERO INTEGER NOT NULL,
ID_ABILITY INTEGER NOT NULL,
SPECIFIC_FEATURES VARCHAR(100),
PRIMARY KEY (ID_HERO, ID_ABILITY)
);
ALTER TABLE HEROIC_ABILITIES add
    FOREIGN KEY (ID_ABILITY) REFERENCES ABILITIES (ID_ABILITY);
ALTER TABLE HEROIC_ABILITIES add
    FOREIGN KEY (ID_HERO) REFERENCES HEROES (ID_HERO);

