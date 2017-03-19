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
    VALUES ('Science Club',         'James Hall',       date(2015), 'Science'),
    VALUES ('Science Fiction Club', 'Aaron Andrews',    date(2011), 'Science'),
    VALUES ('Nature Club',          'Roger Adams',      date(2001), 'Nature'),
    VALUES ('Myth and Religion',    'Rex Texton',       date(2011), 'Religion'),
    VALUES ('LA Philosophy',        'Ryan Shaver',      date(2007), 'Philosophy'),
    VALUES ('Communist Book Club',  'Joseph Stalin',    date(1924), 'Politics'),
    VALUES ('Environmental Readers','Al Gore',          date(2006), 'Science'),
    VALUES ('Politcal USA',         'Al Gore',          date(2000), 'Politics'),
    VALUES ('Political Activists',  'John Goodman',     date(1997), 'Politics'),
    VALUES ('Ocean and Shore Club', 'Sandy Beach',      date(2008), 'Nature');

INSERT INTO Publishers (publisherName, publisherAddress, publisherPhone, publisherEmail)
    VALUES ('CenTech Publishing Co.',       '1000 South Lane, Utah',                '562-111-1111', 'contact@centech.com'),
    VALUES ('Pearson Pub. Co.',             '2777 Ximeno Ave, California',          '661-312-8899', 'personpub@pearson.com'),
    VALUES ('Random House Pub. Co.',        '4523 Cherry Lane, New York',           '585-788-2551', 'random@house.com'),
    VALUES ('McGraw-Hill Pub. Co.',         '2000 Avenida Rotunda, Washington',     '445-251-2115', 'mcgraw@hill.com'),
    VALUES ('Scholastic Pub. Co.',          '9800 Blueberry Avenue, New York',      '585-455-8900', 'scholastic@books.com'),    
    VALUES ('Wiley Pub. Co.',               '27000 Newhall Ave, California',        '661-555-9000', 'wiley@wileybooks.com'),
    VALUES ('Kondasha Pub. Co.',            '6100 Main Street, New York',           '585-727-1211', 'kondasha@konpub.com'),    
    VALUES ('Houghton Mifflin Pub. Co.',    '4567 Hill Drive, Oregon',              '322-544-6999', 'houghton@mifflin.com'),
    VALUES ('Cengage Pub. Co.',             '9000 Swamp Drive, Florida',            '477-963-9663', 'cengage@floridabooks.com'),    
    VALUES ('Harper Collins Pub. Co.',      '1234 Snake Road, Texas',               '211-215-5445', 'harper@collins.com'),
    VALUES ('Simon Pub. Co.',               '2334 Tree Lane, Pennsylvania',         '544-122-3555', 'simon@simonpub.com');
    

INSERT INTO Books (groupName, bookTitle, publisherName, yearPublished, numberPages)
    VALUES ('Science Club', 'Guide to the Galaxy', 'CenTech Publishing Co.', 2014, 300);