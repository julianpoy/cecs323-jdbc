CREATE TABLE WritingGroup(
  groupName varchar(200) NOT NULL,
  headWriter varchar(200) NOT NULL,
  yearFormed date NOT NULL,
  subject varchar(200) NOT NULL,
  PRIMARY KEY(groupName)
);

CREATE TABLE Publishers(
  publisherName varchar(200) NOT NULL,
  publisherAddress varchar(500) NOT NULL,
  publisherPhone varchar(200) NOT NULL,
  publisherEmail varchar(200) NOT NULL,
  PRIMARY KEY(publisherName)
);

CREATE TABLE Books(
  groupName varchar(200) NOT NULL,
  bookTitle varchar(200) NOT NULL,
  publisherName varchar(200) NOT NULL,
  yearPublished integer NOT NULL,
  numberPages integer NOT NULL,
  PRIMARY KEY(groupName, bookTitle),
  FOREIGN KEY(groupName) REFERENCES WritingGroup(groupName),
  FOREIGN KEY(publisherName) REFERENCES Publishers(publisherName)
);

/*
    Note that Al Gore is the headWriter of two separate book
    clubs, and there are multiple clubs with equiv year formed
    as well as subject.
*/
INSERT INTO WritingGroup (groupName, headWriter, yearFormed, subject)
    VALUES ('Science Club',         'James Hall',       date(2015),  'Science'),
    VALUES ('Science Fiction Club', 'Aaron Andrews',    date(2011),  'Fiction'),
    VALUES ('Nature Club',          'Roger Adams',      date(2001),  'Nature'),
    VALUES ('Myth and Religion',    'Rex Texton',       date(2011),  'Religion'),
    VALUES ('LA Philosophy',        'Ryan Shaver',      date(2007),  'Philosophy'),
    VALUES ('Communist Book Club',  'Joseph Stalin',    date(1924),  'Politics'),
    VALUES ('Environmental Readers','Al Gore',          date(2006),  'Science'),
    VALUES ('Politcal USA',         'Al Gore',          date(2000),  'Politics'),
    VALUES ('Political Activists',  'John Goodman',     date(1997),  'Politics'),
    VALUES ('Ocean and Shore Club', 'Sandy Beach',      date(2008),  'Nature');

INSERT INTO Publishers (publisherName, publisherAddress, publisherPhone, publisherEmail)
    VALUES ('CenTech Publishing Co.',       '1000 South Lane, Utah',                '562-111-1111',  'contact@centech.com'),
    VALUES ('Pearson Pub. Co.',             '2777 Ximeno Ave, California',          '661-312-8899',  'personpub@pearson.com'),
    VALUES ('Random House Pub. Co.',        '4523 Cherry Lane, New York',           '585-788-2551',  'random@house.com'),
    VALUES ('McGraw-Hill Pub. Co.',         '2000 Avenida Rotunda, Washington',     '445-251-2115',  'mcgraw@hill.com'),
    VALUES ('Scholastic Pub. Co.',          '9800 Blueberry Avenue, New York',      '585-455-8900',  'scholastic@books.com'),    
    VALUES ('Wiley Pub. Co.',               '27000 Newhall Ave, California',        '661-555-9000',  'wiley@wileybooks.com'),
    VALUES ('Kondasha Pub. Co.',            '6100 Main Street, New York',           '585-727-1211',  'kondasha@konpub.com'),    
    VALUES ('Houghton Mifflin Pub. Co.',    '4567 Hill Drive, Oregon',              '322-544-6999',  'houghton@mifflin.com'),
    VALUES ('Cengage Pub. Co.',             '9000 Swamp Drive, Florida',            '477-963-9663',  'cengage@floridabooks.com'),    
    VALUES ('Harper Collins Pub. Co.',      '1234 Snake Road, Texas',               '211-215-5445',  'harper@collins.com'),
    VALUES ('Simon Pub. Co.',               '2334 Tree Lane, Pennsylvania',         '544-122-3555',  'simon@simonpub.com');
    
/*
    Note: I have made a few shared books among multiple clubs

    Wondering if adding books with same title but different pub/year/pages
    would be useful for testing. Thoughts? 
    -(As of now this is not the case. If this is changed, delete this comment)
*/
INSERT INTO Books (groupName, bookTitle, publisherName, yearPublished, numberPages)
    VALUES ('Science Club',  'Guide to the Galaxy',      'CenTech Publishing Co.', 2014,  300),
    VALUES ('Science Club',  'Cosmos',                   'Pearson Pub. Co.',       2011,  450),
    VALUES ('Science Club',  'The Selfish Gene',         'Wiley Pub. Co.',         2005,  600),
    VALUES ('Science Club',  'On the Origin of Species', 'Wiley Pub. Co.',         2009,  740),

    VALUES ('Science Fiction Club',  'Enders Game',         'Scholastic Pub. Co.',  1987,  330),
    VALUES ('Science Fiction Club',  'Neuromancer',         'Cengage Pub. Co.',     1999,  500),
    VALUES ('Science Fiction Club',  '1984',                'Simon Pub. Co.',       1995,  460),
    VALUES ('Science Fiction Club',  'The Forever War',     'Kondasha Pub. Co.',    2001,  430),

    VALUES ('Nature Club',  'The Snow Leopard',          'McGraw-Hill Pub. Co.',    2009,  200),
    VALUES ('Nature Club',  'Silent Spring',             'McGraw-Hill Pub. Co.',    2003,  415),
    VALUES ('Nature Club',  'All About Yosemite',        'Harper Collins Pub. Co.', 2005,  230),
    VALUES ('Nature Club',  'Pilgrim at Tinker Creek',   'Wiley Pub. Co.',          2000,  404),

    VALUES ('Myth and Religion',  'American Gods',      'Random House Pub. Co.',        2002,  300),
    VALUES ('Myth and Religion',  'Mythology',          'Random House Pub. Co.',        1999,  300),
    VALUES ('Myth and Religion',  'The Holy Bible',     'Houghton Mifflin Pub. Co.',    2016,  900),
    VALUES ('Myth and Religion',  'Mere Christianity',  'Houghton Mifflin Pub. Co.',    2004,  650),

    VALUES ('LA Philosophy',  'Meditations on First Philosophy',    'Wiley Pub. Co.',           2000,  433),
    VALUES ('LA Philosophy',  'Platos Republic',                    'CenTech Publishing Co.',   2005,  300),
    VALUES ('LA Philosophy',  'Beyond Good and Evil',               'Scholastic Pub. Co.',      2002,  1001),
    VALUES ('LA Philosophy',  'Critique of Pure Reason',            'Harper Collins Pub. Co.',  2007,  800),

    VALUES ('Communist Book Club',  'Das Kapital',                      'Wiley Pub. Co.',       2001,  750),
    VALUES ('Communist Book Club',  'Critique of Hegels Philosophy',    'Kondasha Pub. Co.',    1987,  490),
    VALUES ('Communist Book Club',  'The State and Revolution',         'Pearson Pub. Co.',     1990,  740),

    VALUES ('Environmental Readers',  'The Lorax',                          'Person Pub. Co.',          1997,  34),
    VALUES ('Environmental Readers',  'Problems of the Pacific',            'Wiley Pub. Co',            2006,  390),
    VALUES ('Environmental Readers',  'Climate Change: A Brief History',    'Scholastic Pub. Co.',      2003,  470),
    VALUES ('Environmental Readers',  'Desert Solitaire',                   'Random House Pub. Co.',    2009,  330),
    VALUES ('Environmental Readers',  'A History of Extinction',            'Houghton Mifflin Pub. Co.',2004,  587),

    VALUES ('Politcal USA',  'The Prince',                          'Pearson Pub. Co.',             1977,  405),
    VALUES ('Politcal USA',  'The Second Treatise Of Government',   'Wiley Pub. Co.',               1988,  877),
    VALUES ('Politcal USA',  'A Theory of Justice',                 'Houghton Mifflin Pub. Co.',    2008,  766),
    VALUES ('Politcal USA',  'Communist Manifesto',                 'Pearson Pub. Co.',             1966,  500),

    VALUES ('Political Activists',  'A Theory of Justice',      'Houghton Mifflin Pub. Co.',    2008,  766),
    VALUES ('Political Activists',  'Political Liberalism',     'Kondasha Pub. Co.',            2001,  377),
    VALUES ('Political Activists',  'On Libery',                'Pearson Pub. Co.',             1971,  656),

    VALUES ('Ocean and Shore Club',  'Climate Change: A Brief History',  'Scholastic Pub. Co.',     2003,  470),
    VALUES ('Ocean and Shore Club',  'Moby Dick',                        'Cengage Pub. Co.',        1989,  2000),
    VALUES ('Ocean and Shore Club',  'The Edge of the Sea',              'CenTech Publishing Co.',  2005,  233),
    VALUES ('Ocean and Shore Club',  'The Sea Around Us',                'Harper Collins Pub. Co.', 2017,  444),
    VALUES ('Ocean and Shore Club',  'Under the Sea Wind',               'McGraw-Hill Pub. Co.',    2011,  501),
    VALUES ('Ocean and Shore Club',  'Ocean',                            'Houghton Mifflin Pub. Co.',2007, 333);