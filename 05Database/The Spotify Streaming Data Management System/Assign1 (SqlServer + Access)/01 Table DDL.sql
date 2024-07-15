use Assign1;
-- Drop tables in reverse order to avoid foreign key constraints
-- UserFavorites table
DROP TABLE IF EXISTS UserFavorites;

-- UserSubscriptions table
DROP TABLE IF EXISTS UserSubscriptions;

-- UserPlaylistsAudioTracks table
DROP TABLE IF EXISTS UserPlaylistsAudioTracks;

-- UserPlaylists table
DROP TABLE IF EXISTS UserPlaylists;

-- AlbumAuthors table
DROP TABLE IF EXISTS AlbumAuthors;

-- Authors table
DROP TABLE IF EXISTS Authors;

-- AlbumAudioTracks table
DROP TABLE IF EXISTS AlbumAudioTracks;

-- Albums table
DROP TABLE IF EXISTS Albums;

-- AlbumCategories table
DROP TABLE IF EXISTS AlbumCategories;

-- Users table
DROP TABLE IF EXISTS Users;


-- Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username NVARCHAR(50),
    Email NVARCHAR(100),
    Country NVARCHAR(50)
);

-- AlbumCategories table
CREATE TABLE AlbumCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(50)
);

-- Albums table
CREATE TABLE Albums (
    AlbumID INT PRIMARY KEY,
    Title NVARCHAR(50),
    ReleaseDate DATE,
    CategoryID INT FOREIGN KEY REFERENCES AlbumCategories(CategoryID)
);

-- AlbumAudioTracks table
CREATE TABLE AlbumAudioTracks (
    AudioID INT PRIMARY KEY,
    AlbumID INT FOREIGN KEY REFERENCES Albums(AlbumID),
    Title NVARCHAR(50),
    Duration INT -- Assuming duration is in minutes or seconds
);

-- Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName NVARCHAR(50) NOT NULL,
    Country NVARCHAR(50)
);

-- AlbumAuthors table (junction table for Many-to-Many relationship between Authors and Albums)
CREATE TABLE AlbumAuthors (
    AlbumID INT FOREIGN KEY REFERENCES Albums(AlbumID),
    AuthorID INT FOREIGN KEY REFERENCES Authors(AuthorID),
    PRIMARY KEY (AlbumID, AuthorID)
);

-- UserPlaylists table
CREATE TABLE UserPlaylists (
    PlaylistID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    Title NVARCHAR(50),
    CreationDate DATE
);

-- UserPlaylistsAudioTracks table (junction table for Many-to-Many relationship between UserPlaylists and AlbumAudioTracks)
CREATE TABLE UserPlaylistsAudioTracks (
    PlaylistID INT FOREIGN KEY REFERENCES UserPlaylists(PlaylistID),
    AudioID INT FOREIGN KEY REFERENCES AlbumAudioTracks(AudioID),
    PRIMARY KEY (PlaylistID, AudioID)
);

-- UserFavorites table
CREATE TABLE UserFavorites (
    FavoriteID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    AlbumID INT NOT NULL FOREIGN KEY REFERENCES Albums(AlbumID),
    AudioID INT FOREIGN KEY REFERENCES AlbumAudioTracks(AudioID)
);

-- UserSubscriptions table (junction table for Many-to-Many relationship between Users and Subscriptions)
CREATE TABLE UserSubscriptions (
    SubscriptionID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    SubscriptionType NVARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    PaymentStatus NVARCHAR(50)
);



