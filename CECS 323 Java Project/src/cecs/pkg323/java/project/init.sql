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

INSERT INTO WritingGroup (groupName, headWriter, yearFormed, subject)
    VALUES ('Science Club', 'James Hall', date(2015), 'Science'),
    VALUES ('Science Fiction Club', 'Aaron Andrews', date(2011), 'Science'),
    VALUES ('Nature Club', 'Roger Adams', date(2001), 'Nature');

INSERT INTO Publishers (publisherName, publisherAddress, publisherPhone, publisherEmail)
    VALUES ('CenTech Publishing Co.', '1000 South Lane, Utah', '562-111-1111', 'contact@centech.com');

INSERT INTO Books (groupName, bookTitle, publisherName, yearPublished, numberPages)
    VALUES ('Science Club', 'Guide to the Galaxy', 'CenTech Publishing Co.', 2014, 300);