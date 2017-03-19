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
    ('Science Fiction Club', 'Aaron Andrews',    date(2011),  'Fiction'),
    ('Nature Club',          'Roger Adams',      date(2001),  'Nature'),
    ('Myth and Religion',    'Rex Texton',       date(2011),  'Religion'),
    ('LA Philosophy',        'Ryan Shaver',      date(2007),  'Philosophy'),
    ('Communist Book Club',  'Joseph Stalin',    date(1924),  'Politics'),
    ('Environmental Readers','Al Gore',          date(2006),  'Science'),
    ('Politcal USA',         'Al Gore',          date(2000),  'Politics'),
    ('Political Activists',  'John Goodman',     date(1997),  'Politics'),
    ('Ocean and Shore Club', 'Sandy Beach',      date(2008),  'Nature');

/*
    Added some publisherAddress to the same state for testing purposes.
*/
INSERT INTO Publishers (publisherName, publisherAddress, publisherPhone, publisherEmail)
    VALUES ('CenTech Publishing Co.',       '1000 South Lane, Utah',                '562-111-1111',  'contact@centech.com'),
    ('Pearson Pub. Co.',             '2777 Ximeno Ave, California',          '661-312-8899',  'personpub@pearson.com'),
    ('Random House Pub. Co.',        '4523 Cherry Lane, New York',           '585-788-2551',  'random@house.com'),
    ('McGraw-Hill Pub. Co.',         '2000 Avenida Rotunda, Washington',     '445-251-2115',  'mcgraw@hill.com'),
    ('Scholastic Pub. Co.',          '9800 Blueberry Avenue, New York',      '585-455-8900',  'scholastic@books.com'),    
    ('Wiley Pub. Co.',               '27000 Newhall Ave, California',        '661-555-9000',  'wiley@wileybooks.com'),
    ('Kondasha Pub. Co.',            '6100 Main Street, New York',           '585-727-1211',  'kondasha@konpub.com'),    
    ('Houghton Mifflin Pub. Co.',    '4567 Hill Drive, Oregon',              '322-544-6999',  'houghton@mifflin.com'),
    ('Cengage Pub. Co.',             '9000 Swamp Drive, Florida',            '477-963-9663',  'cengage@floridabooks.com'),    
    ('Harper Collins Pub. Co.',      '1234 Snake Road, Texas',               '211-215-5445',  'harper@collins.com'),
    ('Simon Pub. Co.',               '2334 Tree Lane, Pennsylvania',         '544-122-3555',  'simon@simonpub.com');
    
/*
    Note: I have made a few shared books among multiple clubs

    Wondering if adding books with same title but different pub/year/pages
    would be useful for testing. Thoughts? 

    The Books primary key is just the groupName and bookTitle,
    so maybe we wouldn't want to test for this.

    -(As of now this is not the case. If this is changed, delete this comment)
*/
INSERT INTO Books (groupName, bookTitle, publisherName, yearPublished, numberPages)
    VALUES ('Science Club',  'Guide to the Galaxy',      'CenTech Publishing Co.', 2014,  300),
    ('Science Club',  'Cosmos',                   'Pearson Pub. Co.',       2011,  450),
    ('Science Club',  'The Selfish Gene',         'Wiley Pub. Co.',         2005,  600),
    ('Science Club',  'On the Origin of Species', 'Wiley Pub. Co.',         2009,  740),

    ('Science Fiction Club',  'Enders Game',         'Scholastic Pub. Co.',  1987,  330),
    ('Science Fiction Club',  'Neuromancer',         'Cengage Pub. Co.',     1999,  500),
    ('Science Fiction Club',  '1984',                'Simon Pub. Co.',       1995,  460),
    ('Science Fiction Club',  'The Forever War',     'Kondasha Pub. Co.',    2001,  430),

    ('Nature Club',  'The Snow Leopard',          'McGraw-Hill Pub. Co.',    2009,  200),
    ('Nature Club',  'Silent Spring',             'McGraw-Hill Pub. Co.',    2003,  415),
    ('Nature Club',  'All About Yosemite',        'Harper Collins Pub. Co.', 2005,  230),
    ('Nature Club',  'Pilgrim at Tinker Creek',   'Wiley Pub. Co.',          2000,  404),

    ('Myth and Religion',  'American Gods',      'Random House Pub. Co.',        2002,  300),
    ('Myth and Religion',  'Mythology',          'Random House Pub. Co.',        1999,  300),
    ('Myth and Religion',  'The Holy Bible',     'Houghton Mifflin Pub. Co.',    2016,  900),
    ('Myth and Religion',  'Mere Christianity',  'Houghton Mifflin Pub. Co.',    2004,  650),

    ('LA Philosophy',  'Meditations on First Philosophy',    'Wiley Pub. Co.',           2000,  433),
    ('LA Philosophy',  'Platos Republic',                    'CenTech Publishing Co.',   2005,  300),
    ('LA Philosophy',  'Beyond Good and Evil',               'Scholastic Pub. Co.',      2002,  1001),
    ('LA Philosophy',  'Critique of Pure Reason',            'Harper Collins Pub. Co.',  2007,  800),

    ('Communist Book Club',  'Das Kapital',                      'Wiley Pub. Co.',       2001,  750),
    ('Communist Book Club',  'Critique of Hegels Philosophy',    'Kondasha Pub. Co.',    1987,  490),
    ('Communist Book Club',  'The State and Revolution',         'Pearson Pub. Co.',     1990,  740),

    ('Environmental Readers',  'The Lorax',                          'Pearson Pub. Co.',          1997,  34),
    ('Environmental Readers',  'Problems of the Pacific',            'Wiley Pub. Co.',            2006,  390),
    ('Environmental Readers',  'Climate Change: A Brief History',    'Scholastic Pub. Co.',      2003,  470),
    ('Environmental Readers',  'Desert Solitaire',                   'Random House Pub. Co.',    2009,  330),
    ('Environmental Readers',  'A History of Extinction',            'Houghton Mifflin Pub. Co.',2004,  587),

    ('Politcal USA',  'The Prince',                          'Pearson Pub. Co.',             1977,  405),
    ('Politcal USA',  'The Second Treatise Of Government',   'Wiley Pub. Co.',               1988,  877),
    ('Politcal USA',  'A Theory of Justice',                 'Houghton Mifflin Pub. Co.',    2008,  766),
    ('Politcal USA',  'Communist Manifesto',                 'Pearson Pub. Co.',             1966,  500),

    ('Political Activists',  'A Theory of Justice',      'Houghton Mifflin Pub. Co.',    2008,  766),
    ('Political Activists',  'Political Liberalism',     'Kondasha Pub. Co.',            2001,  377),
    ('Political Activists',  'On Libery',                'Pearson Pub. Co.',             1971,  656),

    ('Ocean and Shore Club',  'Climate Change: A Brief History',  'Scholastic Pub. Co.',     2003,  470),
    ('Ocean and Shore Club',  'Moby Dick',                        'Cengage Pub. Co.',        1989,  2000),
    ('Ocean and Shore Club',  'The Edge of the Sea',              'CenTech Publishing Co.',  2005,  233),
    ('Ocean and Shore Club',  'The Sea Around Us',                'Harper Collins Pub. Co.', 2017,  444),
    ('Ocean and Shore Club',  'Under the Sea Wind',               'McGraw-Hill Pub. Co.',    2011,  501),
    ('Ocean and Shore Club',  'Ocean',                            'Houghton Mifflin Pub. Co.',2007, 333);