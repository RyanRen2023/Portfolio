-- if don't do this, oracle will recognize & plus character &B.. as a parameter
SET DEFINE OFF; 

-- Empty all the tables;
DELETE FROM dbo.UserFavorites;
DELETE FROM dbo.UserPlaylistsAudioTracks;
DELETE FROM dbo.UserSubscriptions;
DELETE FROM dbo.UserPlaylists;
DELETE FROM dbo.AlbumAuthors;
DELETE FROM dbo.AlbumAudioTracks;
DELETE FROM dbo.Authors;
DELETE FROM dbo.Albums;
DELETE FROM dbo.AlbumCategories;
DELETE FROM dbo.Users;
commit;
/
-- 
DELETE FROM dbo.UserFavorites_history;
DELETE FROM dbo.UserPlaylistsAudioTracks_history;
DELETE FROM dbo.UserSubscriptions_history;
DELETE FROM dbo.UserPlaylists_history;
DELETE FROM dbo.AlbumAuthors_history;
DELETE FROM dbo.AlbumAudioTracks_history;
DELETE FROM dbo.Authors_history;
DELETE FROM dbo.Albums_history;
DELETE FROM dbo.AlbumCategories_history;
DELETE FROM dbo.Users_history;
commit;
/



-- Create test data for users
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (1, 'John Doe', 'john.doe@example.com', 'USA');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (2, 'Jane Smith', 'jane.smith@example.com', 'Canada');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (3, 'Mike Johnson', 'mike.johnson@example.com', 'UK');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (4, 'Emily Brown', 'emily.brown@example.com', 'Australia');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (5, 'Daniel Lee', 'daniel.lee@example.com', 'Germany');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (6, 'Sophia Kim', 'sophia.kim@example.com', 'France');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (7, 'David Wilson', 'david.wilson@example.com', 'Brazil');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (8, 'Olivia Martinez', 'olivia.martinez@example.com', 'Mexico');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (9, 'James Chen', 'james.chen@example.com', 'China');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (10, 'Isabella Nguyen', 'isabella.nguyen@example.com', 'Vietnam');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (11, 'Ethan Garcia', 'ethan.garcia@example.com', 'Spain');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (12, 'Ava Rodriguez', 'ava.rodriguez@example.com', 'Italy');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (13, 'Logan Kim', 'logan.kim@example.com', 'Japan');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (14, 'Emma Wong', 'emma.wong@example.com', 'South Korea');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (15, 'Mia Patel', 'mia.patel@example.com', 'India');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (16, 'Noah Hernandez', 'noah.hernandez@example.com', 'Argentina');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (17, 'Liam Ali', 'liam.ali@example.com', 'Saudi Arabia');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (18, 'Aria Wang', 'aria.wang@example.com', 'Taiwan');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (19, 'Lucas Kim', 'lucas.kim@example.com', 'Philippines');
INSERT INTO Users (UserID, Username, Email, Country) VALUES
    (20, 'Zoe Yamamoto', 'zoe.yamamoto@example.com', 'Japan');

-- test data for AlbumCategories;
INSERT INTO AlbumCategories (CategoryID, CategoryName) VALUES
    (1, 'Rock');
INSERT INTO AlbumCategories (CategoryID, CategoryName) VALUES
    (2, 'Pop');
INSERT INTO AlbumCategories (CategoryID, CategoryName) VALUES
    (3, 'Hip Hop');
INSERT INTO AlbumCategories (CategoryID, CategoryName) VALUES
    (4, 'Jazz');
INSERT INTO AlbumCategories (CategoryID, CategoryName) VALUES
    (5, 'Country');
INSERT INTO AlbumCategories (CategoryID, CategoryName) VALUES
    (6, 'Electronic');
INSERT INTO AlbumCategories (CategoryID, CategoryName) VALUES
    (7, 'Classical');
INSERT INTO AlbumCategories (CategoryID, CategoryName) VALUES
    (8, 'R B');
INSERT INTO AlbumCategories (CategoryID, CategoryName) VALUES
    (9, 'Reggae');
INSERT INTO AlbumCategories (CategoryID, CategoryName) VALUES
    (10, 'Metal');
    


-- test data for Albums

INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (1, 'The Rock Odyssey', TO_DATE('2022-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (2, 'Pop Sensation', TO_DATE('2022-02-20', 'YYYY-MM-DD'), 2);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (3, 'Hip Hop Evolution', TO_DATE('2022-03-25', 'YYYY-MM-DD'), 3);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (4, 'Jazz Harmony', TO_DATE('2022-04-10', 'YYYY-MM-DD'), 4);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (5, 'Country Roads', TO_DATE('2022-05-05', 'YYYY-MM-DD'), 5);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (6, 'Electronic Vibes', TO_DATE('2022-06-30', 'YYYY-MM-DD'), 6);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (7, 'Classical Masterpieces', TO_DATE('2022-07-15', 'YYYY-MM-DD'), 7);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (8, 'R&B Groove', TO_DATE('2022-08-20', 'YYYY-MM-DD'), 8);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (9, 'Reggae Roots', TO_DATE('2022-09-25', 'YYYY-MM-DD'), 9);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (10, 'Metal Madness', TO_DATE('2022-10-10', 'YYYY-MM-DD'), 10);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (11, 'Epic Rock Anthems', TO_DATE('2022-11-15', 'YYYY-MM-DD'), 1);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (12, 'Pop Extravaganza', TO_DATE('2022-12-20', 'YYYY-MM-DD'), 2);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (13, 'Hip Hop Chronicles', TO_DATE('2023-01-25', 'YYYY-MM-DD'), 3);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (14, 'Jazz Fusion', TO_DATE('2023-02-10', 'YYYY-MM-DD'), 4);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (15, 'Country Serenade', TO_DATE('2023-03-15', 'YYYY-MM-DD'), 5);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (16, 'Electronic Dreams', TO_DATE('2023-04-20', 'YYYY-MM-DD'), 6);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (17, 'Timeless Classics', TO_DATE('2023-05-25', 'YYYY-MM-DD'), 7);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (18, 'Soulful Rhythms', TO_DATE('2023-06-30', 'YYYY-MM-DD'), 8);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (19, 'Reggae Vibes', TO_DATE('2023-07-15', 'YYYY-MM-DD'), 9);
INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID) VALUES
    (20, 'Heavy Metal Thunder', TO_DATE('2023-08-20', 'YYYY-MM-DD'), 10);


-- Test data from AlbumAudioTracks

INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (1, 1, 'Intro to Rock', 180);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (2, 1, 'Rock Anthem', 240);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (3, 2, 'Pop Celebration', 210);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (4, 2, 'Dance Party Groove', 180);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (5, 3, 'Hip Hop Beats', 240);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (6, 3, 'Rap Flow', 200);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (7, 4, 'Jazz Improv', 300);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (8, 4, 'Smooth Jazz Serenity', 240);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (9, 5, 'Country Sunset', 220);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (10, 5, 'Bluegrass Jamboree', 180);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (11, 6, 'Electronic Dreamscape', 300);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (12, 6, 'Techno Pulse', 240);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (13, 7, 'Classical Symphony', 360);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (14, 7, 'Baroque Elegance', 300);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (15, 8, 'R&B Slow Jam', 240);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (16, 8, 'Funky Groove', 180);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (17, 9, 'Reggae Relaxation', 220);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (18, 9, 'Dub Reggae Vibes', 180);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (19, 10, 'Metal Mayhem', 300);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (20, 10, 'Shredding Guitar Solo', 240);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (21, 11, 'Rock Ballad', 240);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (22, 11, 'Epic Guitar Solo', 180);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (23, 12, 'Pop Ballad', 240);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (24, 12, 'Upbeat Pop Anthem', 200);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (25, 13, 'Hip Hop Storytelling', 300);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (26, 13, 'Urban Beats', 240);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (27, 14, 'Jazz Fusion Jam', 360);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (28, 14, 'Smooth Jazz Melody', 300);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (29, 15, 'Country Love Song', 240);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (30, 15, 'Banjo Bluegrass', 180);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (31, 16, 'Electronic Exploration', 300);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (32, 16, 'House Music Groove', 240);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (33, 17, 'Classical Waltz', 360);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (34, 17, 'Romantic Strings', 300);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (35, 18, 'R&B Soulful Ballad', 240);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (36, 18, 'Funky Rhythm Section', 180);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (37, 19, 'Reggae Dub Instrumental', 220);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (38, 19, 'Reggae Party Vibes', 180);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (39, 20, 'Metal Power Ballad', 300);
INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration) VALUES
    (40, 20, 'Thrash Metal Madness', 240);


-- test data from Authors
INSERT INTO Authors (AuthorID, AuthorName, Country) VALUES (1, 'John Smith', 'USA');
INSERT INTO Authors (AuthorID, AuthorName, Country) VALUES (2, 'Emily Johnson', 'Canada');
INSERT INTO Authors (AuthorID, AuthorName, Country) VALUES (3, 'Daniel Brown', 'UK');
INSERT INTO Authors (AuthorID, AuthorName, Country) VALUES (4, 'Sophia Lee', 'Australia');
INSERT INTO Authors (AuthorID, AuthorName, Country) VALUES (5, 'Michael Chen', 'Germany');

INSERT INTO Authors (AuthorID, AuthorName, Country) VALUES (6, 'Michael Chen', 'Germany');


-- Test Data for AlbumAuthors

INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (1, 1); -- John Smith
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (2, 2); -- Emily Johnson
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (3, 3); -- Daniel Brown
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (4, 4); -- Sophia Lee
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (5, 5); -- Michael Chen
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (6, 1); -- John Smith
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (7, 2); -- Emily Johnson
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (8, 3); -- Daniel Brown
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (9, 4); -- Sophia Lee
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (10, 5); -- Michael Chen
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (11, 1); -- John Smith
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (12, 2); -- Emily Johnson
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (13, 3); -- Daniel Brown
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (14, 4); -- Sophia Lee
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (15, 5); -- Michael Chen
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (16, 1); -- John Smith
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (17, 2); -- Emily Johnson
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (18, 3); -- Daniel Brown
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (19, 4); -- Sophia Lee
INSERT INTO AlbumAuthors (AlbumID, AuthorID) VALUES (20, 5); -- Michael Chen

-- test data from UserPlaylists
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (1, 1, 'John Playlist 1', TO_DATE('2022-01-15', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (2, 1, 'John Playlist 2', TO_DATE('2022-02-20', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (3, 1, 'John Playlist 3', TO_DATE('2022-03-25', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (4, 2, 'Jane Playlist 1', TO_DATE('2022-04-10', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (5, 2, 'Jane Playlist 2', TO_DATE('2022-05-05', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (6, 3, 'Mike Playlist 1', TO_DATE('2022-06-30', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (7, 4, 'Emily Playlist 1', TO_DATE('2022-07-15', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (8, 5, 'Daniel Playlist 1', TO_DATE('2022-08-20', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (9, 5, 'Daniel Playlist 2', TO_DATE('2022-09-25', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (10, 5, 'Daniel Playlist 3', TO_DATE('2022-10-10', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (11, 6, 'Sophia Playlist 1', TO_DATE('2022-11-15', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (12, 6, 'Sophia Playlist 2', TO_DATE('2022-12-20', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (13, 7, 'David Playlist 1', TO_DATE('2023-01-25', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (14, 8, 'Olivia Playlist 1', TO_DATE('2023-02-10', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (15, 9, 'James Playlist 1', TO_DATE('2023-03-15', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (16, 10, 'Isabella Playlist 1', TO_DATE('2023-04-20', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (17, 11, 'Ethan Playlist 1', TO_DATE('2023-05-25', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (18, 12, 'Ava Playlist 1', TO_DATE('2023-06-30', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (19, 13, 'Logan Playlist 1', TO_DATE('2023-07-15', 'YYYY-MM-DD'));
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate) VALUES (20, 14, 'Emma Playlist 1', TO_DATE('2023-08-20', 'YYYY-MM-DD'));


-- test data for UserPlaylistsAudioTracks
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (1, 1); -- John's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (1, 2); -- John's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (1, 3); -- John's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (2, 4); -- Jane's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (2, 5); -- Jane's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (3, 6); -- Mike's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (4, 7); -- Emily's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (5, 8); -- Daniel's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (5, 9); -- Daniel's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (5, 10); -- Daniel's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (6, 11); -- Sophia's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (6, 12); -- Sophia's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (7, 13); -- David's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (8, 14); -- Olivia's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (9, 15); -- James's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (10, 16); -- Isabella's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (11, 17); -- Ethan's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (12, 18); -- Ava's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (13, 19); -- Logan's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (14, 20); -- Emma's Playlist 1
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (15, 1); -- John's Playlist 2
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (15, 5); -- Jane's Playlist 2
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (16, 7); -- Mike's Playlist 2
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (17, 8); -- Emily's Playlist 2
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (17, 10); -- Daniel's Playlist 2
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (18, 12); -- Sophia's Playlist 2
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (19, 14); -- David's Playlist 2
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (19, 16); -- Olivia's Playlist 2
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (20, 18); -- James's Playlist 2
INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID) VALUES (20, 20); -- Isabella's Playlist 2

-- test data for UserFavorites
INSERT INTO UserFavorites (FavoriteID, UserID, AlbumID, AudioID) VALUES (1, 1, 1, 1); -- John's favorite song from Album1
INSERT INTO UserFavorites (FavoriteID, UserID, AlbumID, AudioID) VALUES (2, 1, 2, 3); -- John's favorite song from Album2
INSERT INTO UserFavorites (FavoriteID, UserID, AlbumID, AudioID) VALUES (3, 2, 3, 5); -- Jane's favorite song from Album3
INSERT INTO UserFavorites (FavoriteID, UserID, AlbumID, AudioID) VALUES (4, 3, 4, 7); -- Mike's favorite song from Album4
INSERT INTO UserFavorites (FavoriteID, UserID, AlbumID, AudioID) VALUES (5, 4, 5, 9); -- Emily's favorite song from Album5
INSERT INTO UserFavorites (FavoriteID, UserID, AlbumID, AudioID) VALUES (6, 5, 6, 11); -- Daniel's favorite song from Album6
INSERT INTO UserFavorites (FavoriteID, UserID, AlbumID, AudioID) VALUES (7, 6, 7, 13); -- Sophia's favorite song from Album7
INSERT INTO UserFavorites (FavoriteID, UserID, AlbumID, AudioID) VALUES (8, 7, 8, 15); -- David's favorite song from Album8
INSERT INTO UserFavorites (FavoriteID, UserID, AlbumID, AudioID) VALUES (9, 8, 9, 17); -- Olivia's favorite song from Album9
INSERT INTO UserFavorites (FavoriteID, UserID, AlbumID, AudioID) VALUES (10, 9, 10, 19); -- James's favorite song from Album10


-- test data for UserSubscriptions

INSERT INTO UserSubscriptions (SubscriptionID, UserID, SubscriptionType, StartDate, EndDate, PaymentStatus) VALUES (1, 1, 'Free', TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), 'Paid');
INSERT INTO UserSubscriptions (SubscriptionID, UserID, SubscriptionType, StartDate, EndDate, PaymentStatus) VALUES (2, 2, 'Premium', TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2023-02-14', 'YYYY-MM-DD'), 'Paid');
INSERT INTO UserSubscriptions (SubscriptionID, UserID, SubscriptionType, StartDate, EndDate, PaymentStatus) VALUES (3, 3, 'Free', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2023-02-28', 'YYYY-MM-DD'), 'Unpaid');
INSERT INTO UserSubscriptions (SubscriptionID, UserID, SubscriptionType, StartDate, EndDate, PaymentStatus) VALUES (4, 4, 'Premium', TO_DATE('2022-04-10', 'YYYY-MM-DD'), TO_DATE('2023-04-09', 'YYYY-MM-DD'), 'Paid');
INSERT INTO UserSubscriptions (SubscriptionID, UserID, SubscriptionType, StartDate, EndDate, PaymentStatus) VALUES (5, 5, 'Free', TO_DATE('2022-05-15', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 'Paid');
INSERT INTO UserSubscriptions (SubscriptionID, UserID, SubscriptionType, StartDate, EndDate, PaymentStatus) VALUES (6, 6, 'Premium', TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_DATE('2023-05-31', 'YYYY-MM-DD'), 'Paid');
INSERT INTO UserSubscriptions (SubscriptionID, UserID, SubscriptionType, StartDate, EndDate, PaymentStatus) VALUES (7, 7, 'Free', TO_DATE('2022-07-10', 'YYYY-MM-DD'), TO_DATE('2023-07-09', 'YYYY-MM-DD'), 'Paid');
INSERT INTO UserSubscriptions (SubscriptionID, UserID, SubscriptionType, StartDate, EndDate, PaymentStatus) VALUES (8, 8, 'Premium', TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_DATE('2023-08-19', 'YYYY-MM-DD'), 'Unpaid');
INSERT INTO UserSubscriptions (SubscriptionID, UserID, SubscriptionType, StartDate, EndDate, PaymentStatus) VALUES (9, 9, 'Free', TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 'Paid');
INSERT INTO UserSubscriptions (SubscriptionID, UserID, SubscriptionType, StartDate, EndDate, PaymentStatus) VALUES (10, 10, 'Premium', TO_DATE('2022-10-15', 'YYYY-MM-DD'), TO_DATE('2023-10-14', 'YYYY-MM-DD'), 'Paid');

commit;

-- check your data make sure every table has data.
SELECT COUNT(*) FROM dbo.UserFavorites;
SELECT COUNT(*) FROM dbo.UserPlaylistsAudioTracks;
SELECT COUNT(*) FROM dbo.UserSubscriptions;
SELECT COUNT(*) FROM dbo.UserPlaylists;
SELECT COUNT(*) FROM dbo.AlbumAuthors;
SELECT COUNT(*) FROM dbo.AlbumAudioTracks;
SELECT COUNT(*) FROM dbo.Authors;
SELECT COUNT(*) FROM dbo.Albums;
SELECT COUNT(*) FROM dbo.AlbumCategories;
SELECT COUNT(*) FROM dbo.Users;


    