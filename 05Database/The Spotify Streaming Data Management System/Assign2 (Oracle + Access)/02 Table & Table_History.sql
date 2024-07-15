-- execute under sqlplus
--conn assign2Admin/assign2AdminPassword
-- Drop tables in reverse order to avoid foreign key constraints
-- UserFavorites table
DROP TABLE UserFavorites;

-- UserSubscriptions table
DROP TABLE UserSubscriptions;

-- UserPlaylistsAudioTracks table
DROP TABLE UserPlaylistsAudioTracks;

-- UserPlaylists table
DROP TABLE UserPlaylists;

-- AlbumAuthors table
DROP TABLE AlbumAuthors;

-- Authors table
DROP TABLE Authors;

-- AlbumAudioTracks table
DROP TABLE AlbumAudioTracks;

-- Albums table
DROP TABLE Albums;

-- AlbumCategories table
DROP TABLE AlbumCategories;

-- Users table
DROP TABLE Users;

-- Drop statement for Users_History table
DROP TABLE Users_History;

-- Drop statement for AlbumCategories_History table
DROP TABLE AlbumCategories_History;

-- Drop statement for Albums_History table
DROP TABLE Albums_History;

-- Drop statement for AlbumAudioTracks_History table
DROP TABLE AlbumAudioTracks_History;

-- Drop statement for Authors_History table
DROP TABLE Authors_History;

-- Drop statement for AlbumAuthors_History table
DROP TABLE AlbumAuthors_History;

-- Drop statement for UserPlaylists_History table
DROP TABLE UserPlaylists_History;

-- Drop statement for UserPlaylistsAudioTracks_History table
DROP TABLE UserPlaylistsAudioTracks_History;

-- Drop statement for UserFavorites_History table
DROP TABLE UserFavorites_History;

-- Drop statement for UserSubscriptions_History table
DROP TABLE UserSubscriptions_History;



-- Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username NVARCHAR2(50),
    Email NVARCHAR2(100),
    Country NVARCHAR2(50)
);

-- AlbumCategories table
CREATE TABLE AlbumCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR2(50)
);

-- Albums table
CREATE TABLE Albums (
    AlbumID INT PRIMARY KEY,
    Title NVARCHAR2(50),
    ReleaseDate DATE,
    CategoryID CONSTRAINT fk_categoryId REFERENCES AlbumCategories(CategoryID)
);

-- AlbumAudioTracks table
CREATE TABLE AlbumAudioTracks (
    AudioID INT PRIMARY KEY,
    AlbumID CONSTRAINT fk_albumid_tracks  REFERENCES Albums(AlbumID),
    Title NVARCHAR2(50),
    Duration INT -- Assuming duration is in minutes or seconds
);

-- Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName NVARCHAR2(50) NOT NULL,
    Country NVARCHAR2(50)
);

-- AlbumAuthors table (junction table for Many-to-Many relationship between Authors and Albums)
CREATE TABLE AlbumAuthors (
    AlbumID constraint fk_albumid_author REFERENCES Albums(AlbumID),
    AuthorID constraint fk_authorid_album REFERENCES Authors(AuthorID),
    PRIMARY KEY (AlbumID, AuthorID)
);

-- UserPlaylists table
CREATE TABLE UserPlaylists (
    PlaylistID INT PRIMARY KEY,
    UserID constraint fk_userid_playlist REFERENCES Users(UserID),
    Title NVARCHAR2(50),
    CreationDate DATE
);

-- UserPlaylistsAudioTracks table (junction table for Many-to-Many relationship between UserPlaylists and AlbumAudioTracks)
CREATE TABLE UserPlaylistsAudioTracks (
    PlaylistID constraint fk_playlistid_audio REFERENCES UserPlaylists(PlaylistID),
    AudioID constraint fk_audioid_playlist REFERENCES AlbumAudioTracks(AudioID),
    PRIMARY KEY (PlaylistID, AudioID)
);

-- UserFavorites table
CREATE TABLE UserFavorites (
    FavoriteID INT PRIMARY KEY,
    UserID constraint fk_userid_favorites REFERENCES Users(UserID) not null,
    AlbumID constraint fk_albumid_fav REFERENCES Albums(AlbumID),
    AudioID constraint fk_audioid_fav REFERENCES AlbumAudioTracks(AudioID),
    constraint not_both_null check(albumid is not null or audioid is not null)
);

-- UserSubscriptions table (junction table for Many-to-Many relationship between Users and Subscriptions)
CREATE TABLE UserSubscriptions (
    SubscriptionID INT PRIMARY KEY,
    UserID constraint fk_user_sub REFERENCES Users(UserID) not null,
    SubscriptionType NVARCHAR2(50),
    StartDate DATE,
    EndDate DATE,
    PaymentStatus NVARCHAR2(50)
);


       
-- Create history tables

-- creata Users history table
CREATE TABLE Users_History (
    HistoryID INT PRIMARY KEY,
    UserID INT,
    Username NVARCHAR2(50),
    Email NVARCHAR2(100),
    Country NVARCHAR2(50),
    Action NVARCHAR2(10), -- record insert,delete,update operation
    ActionTimestamp TIMESTAMP
);

-- creata AlbumCategories history table
CREATE TABLE AlbumCategories_History (
    HistoryID INT PRIMARY KEY,
    CategoryID INT,
    CategoryName NVARCHAR2(50),
    Action NVARCHAR2(10), -- record insert,delete,update operation
    ActionTimestamp TIMESTAMP
);

-- creata Albums history table
CREATE TABLE Albums_History (
    HistoryID INT PRIMARY KEY,
    AlbumID INT,
    Title NVARCHAR2(50),
    ReleaseDate DATE,
    CategoryID INT,
    Action NVARCHAR2(10), -- record insert,delete,update operation
    ActionTimestamp TIMESTAMP
);

-- creata AlbumAudioTracks history table
CREATE TABLE AlbumAudioTracks_History (
    HistoryID INT PRIMARY KEY,
    AudioID INT,
    AlbumID INT,
    Title NVARCHAR2(50),
    Duration INT,
    Action NVARCHAR2(10), -- record insert,delete,update operation
    ActionTimestamp TIMESTAMP
);

-- creata Authors history table
CREATE TABLE Authors_History (
    HistoryID INT PRIMARY KEY,
    AuthorID INT,
    AuthorName NVARCHAR2(50),
    Country NVARCHAR2(50),
    Action NVARCHAR2(10), -- record insert,delete,update operation
    ActionTimestamp TIMESTAMP
);

-- creata AlbumAuthors history table
CREATE TABLE AlbumAuthors_History (
    HistoryID INT PRIMARY KEY,
    AlbumID INT,
    AuthorID INT,
    Action NVARCHAR2(10), -- record insert,delete,update operation
    ActionTimestamp TIMESTAMP
);

-- creata UserPlaylists history table
CREATE TABLE UserPlaylists_History (
    HistoryID INT PRIMARY KEY,
    PlaylistID INT,
    UserID INT,
    Title NVARCHAR2(50),
    CreationDate DATE,
    Action NVARCHAR2(10), -- record insert,delete,update operation
    ActionTimestamp TIMESTAMP
);

-- creata UserPlaylistsAudioTracks history table
CREATE TABLE UserPlaylistsAudioTracks_History (
    HistoryID INT PRIMARY KEY,
    PlaylistID INT,
    AudioID INT,
    Action NVARCHAR2(10),
    ActionTimestamp TIMESTAMP
);

-- creata UserFavorites history table
CREATE TABLE UserFavorites_History (
    HistoryID INT PRIMARY KEY,
    FavoriteID INT,
    UserID INT,
    AlbumID INT,
    AudioID INT,
    Action NVARCHAR2(10), -- record insert,delete,update operation
    ActionTimestamp TIMESTAMP
);

-- creata UserSubscriptions history table
CREATE TABLE UserSubscriptions_History (
    HistoryID INT PRIMARY KEY,
    SubscriptionID INT,
    UserID INT,
    SubscriptionType NVARCHAR2(50),
    StartDate DATE,
    EndDate DATE,
    PaymentStatus NVARCHAR2(50),
    Action NVARCHAR2(10), -- record insert,delete,update operation
    ActionTimestamp TIMESTAMP
);






