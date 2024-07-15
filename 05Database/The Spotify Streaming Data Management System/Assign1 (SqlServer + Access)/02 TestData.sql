use Assign1;
-- empty all the tables;
DELETE FROM UserFavorites;
DELETE FROM UserPlaylistsAudioTracks;
DELETE FROM UserSubscriptions;
DELETE FROM UserPlaylists;
DELETE FROM AlbumAuthors;
DELETE FROM AlbumAudioTracks;
DELETE FROM Authors;
DELETE FROM Albums;
DELETE FROM AlbumCategories;
DELETE FROM Users;

-- ??10?????????UserID??????????
INSERT INTO Users (UserID, Username, Email, Country)
VALUES
    (1, 'John Doe', 'john.doe@example.com', 'USA'),
    (2, 'Jane Smith', 'jane.smith@example.com', 'Canada'),
    (3, 'Mike Johnson', 'mike.johnson@example.com', 'UK'),
    (4, 'Emily Brown', 'emily.brown@example.com', 'Australia'),
    (5, 'Daniel Lee', 'daniel.lee@example.com', 'Germany'),
    (6, 'Sophia Kim', 'sophia.kim@example.com', 'France'),
    (7, 'David Wilson', 'david.wilson@example.com', 'Brazil'),
    (8, 'Olivia Martinez', 'olivia.martinez@example.com', 'Mexico'),
    (9, 'James Chen', 'james.chen@example.com', 'China'),
    (10, 'Isabella Nguyen', 'isabella.nguyen@example.com', 'Vietnam'),
    (11, 'Ethan Garcia', 'ethan.garcia@example.com', 'Spain'),
    (12, 'Ava Rodriguez', 'ava.rodriguez@example.com', 'Italy'),
    (13, 'Logan Kim', 'logan.kim@example.com', 'Japan'),
    (14, 'Emma Wong', 'emma.wong@example.com', 'South Korea'),
    (15, 'Mia Patel', 'mia.patel@example.com', 'India'),
    (16, 'Noah Hernandez', 'noah.hernandez@example.com', 'Argentina'),
    (17, 'Liam Ali', 'liam.ali@example.com', 'Saudi Arabia'),
    (18, 'Aria Wang', 'aria.wang@example.com', 'Taiwan'),
    (19, 'Lucas Kim', 'lucas.kim@example.com', 'Philippines'),
    (20, 'Zoe Yamamoto', 'zoe.yamamoto@example.com', 'Japan');


--test data for AlbumCategories;

INSERT INTO AlbumCategories (CategoryID, CategoryName)
VALUES
    (1, 'Rock'),
    (2, 'Pop'),
    (3, 'Hip Hop'),
    (4, 'Jazz'),
    (5, 'Country'),
    (6, 'Electronic'),
    (7, 'Classical'),
    (8, 'R&B'),
    (9, 'Reggae'),
    (10, 'Metal');

-- test data for Albums

INSERT INTO Albums (AlbumID, Title, ReleaseDate, CategoryID)
VALUES
    (1, 'The Rock Odyssey', '2022-01-15', 1),
    (2, 'Pop Sensation', '2022-02-20', 2),
    (3, 'Hip Hop Evolution', '2022-03-25', 3),
    (4, 'Jazz Harmony', '2022-04-10', 4),
    (5, 'Country Roads', '2022-05-05', 5),
    (6, 'Electronic Vibes', '2022-06-30', 6),
    (7, 'Classical Masterpieces', '2022-07-15', 7),
    (8, 'R&B Groove', '2022-08-20', 8),
    (9, 'Reggae Roots', '2022-09-25', 9),
    (10, 'Metal Madness', '2022-10-10', 10),
    (11, 'Epic Rock Anthems', '2022-11-15', 1),
    (12, 'Pop Extravaganza', '2022-12-20', 2),
    (13, 'Hip Hop Chronicles', '2023-01-25', 3),
    (14, 'Jazz Fusion', '2023-02-10', 4),
    (15, 'Country Serenade', '2023-03-15', 5),
    (16, 'Electronic Dreams', '2023-04-20', 6),
    (17, 'Timeless Classics', '2023-05-25', 7),
    (18, 'Soulful Rhythms', '2023-06-30', 8),
    (19, 'Reggae Vibes', '2023-07-15', 9),
    (20, 'Heavy Metal Thunder', '2023-08-20', 10);

-- Test data from AlbumAudioTracks

INSERT INTO AlbumAudioTracks (AudioID, AlbumID, Title, Duration)
VALUES
    (1, 1, 'Intro to Rock', 180),
    (2, 1, 'Rock Anthem', 240),
    (3, 2, 'Pop Celebration', 210),
    (4, 2, 'Dance Party Groove', 180),
    (5, 3, 'Hip Hop Beats', 240),
    (6, 3, 'Rap Flow', 200),
    (7, 4, 'Jazz Improv', 300),
    (8, 4, 'Smooth Jazz Serenity', 240),
    (9, 5, 'Country Sunset', 220),
    (10, 5, 'Bluegrass Jamboree', 180),
    (11, 6, 'Electronic Dreamscape', 300),
    (12, 6, 'Techno Pulse', 240),
    (13, 7, 'Classical Symphony', 360),
    (14, 7, 'Baroque Elegance', 300),
    (15, 8, 'R&B Slow Jam', 240),
    (16, 8, 'Funky Groove', 180),
    (17, 9, 'Reggae Relaxation', 220),
    (18, 9, 'Dub Reggae Vibes', 180),
    (19, 10, 'Metal Mayhem', 300),
    (20, 10, 'Shredding Guitar Solo', 240),
    (21, 11, 'Rock Ballad', 240),
    (22, 11, 'Epic Guitar Solo', 180),
    (23, 12, 'Pop Ballad', 240),
    (24, 12, 'Upbeat Pop Anthem', 200),
    (25, 13, 'Hip Hop Storytelling', 300),
    (26, 13, 'Urban Beats', 240),
    (27, 14, 'Jazz Fusion Jam', 360),
    (28, 14, 'Smooth Jazz Melody', 300),
    (29, 15, 'Country Love Song', 240),
    (30, 15, 'Banjo Bluegrass', 180),
    (31, 16, 'Electronic Exploration', 300),
    (32, 16, 'House Music Groove', 240),
    (33, 17, 'Classical Waltz', 360),
    (34, 17, 'Romantic Strings', 300),
    (35, 18, 'R&B Soulful Ballad', 240),
    (36, 18, 'Funky Rhythm Section', 180),
    (37, 19, 'Reggae Dub Instrumental', 220),
    (38, 19, 'Reggae Party Vibes', 180),
    (39, 20, 'Metal Power Ballad', 300),
    (40, 20, 'Thrash Metal Madness', 240);

-- test data from Authors
INSERT INTO Authors (AuthorID, AuthorName, Country)
VALUES
    (1, 'John Smith', 'USA'),
    (2, 'Emily Johnson', 'Canada'),
    (3, 'Daniel Brown', 'UK'),
    (4, 'Sophia Lee', 'Australia'),
    (5, 'Michael Chen', 'Germany');

-- Test Data for AlbumAuthors

INSERT INTO AlbumAuthors (AlbumID, AuthorID)
VALUES
    (1, 1), -- John Smith
    (2, 2), -- Emily Johnson
    (3, 3), -- Daniel Brown
    (4, 4), -- Sophia Lee
    (5, 5), -- Michael Chen
    (6, 1), -- John Smith
    (7, 2), -- Emily Johnson
    (8, 3), -- Daniel Brown
    (9, 4), -- Sophia Lee
    (10, 5), -- Michael Chen
    (11, 1), -- John Smith
    (12, 2), -- Emily Johnson
    (13, 3), -- Daniel Brown
    (14, 4), -- Sophia Lee
    (15, 5), -- Michael Chen
    (16, 1), -- John Smith
    (17, 2), -- Emily Johnson
    (18, 3), -- Daniel Brown
    (19, 4), -- Sophia Lee
    (20, 5); -- Michael Chen
GO
-- test data from UserPlaylists
INSERT INTO UserPlaylists (PlaylistID, UserID, Title, CreationDate)
VALUES
    (1, 1, 'John Playlist 1', '2022-01-15'),
    (2, 1, 'John Playlist 2', '2022-02-20'),
    (3, 1, 'John Playlist 3', '2022-03-25'),
    (4, 2, 'Jane Playlist 1', '2022-04-10'),
    (5, 2, 'Jane Playlist 2', '2022-05-05'),
    (6, 3, 'Mike Playlist 1', '2022-06-30'),
    (7, 4, 'Emily Playlist 1', '2022-07-15'),
    (8, 5, 'Daniel Playlist 1', '2022-08-20'),
    (9, 5, 'Daniel Playlist 2', '2022-09-25'),
    (10, 5, 'Daniel Playlist 3', '2022-10-10'),
    (11, 6, 'Sophia Playlist 1', '2022-11-15'),
    (12, 6, 'Sophia Playlist 2', '2022-12-20'),
    (13, 7, 'David Playlist 1', '2023-01-25'),
    (14, 8, 'Olivia Playlist 1', '2023-02-10'),
    (15, 9, 'James Playlist 1', '2023-03-15'),
    (16, 10, 'Isabella Playlist 1', '2023-04-20'),
    (17, 11, 'Ethan Playlist 1', '2023-05-25'),
    (18, 12, 'Ava Playlist 1', '2023-06-30'),
    (19, 13, 'Logan Playlist 1', '2023-07-15'),
    (20, 14, 'Emma Playlist 1', '2023-08-20');
GO

INSERT INTO UserPlaylistsAudioTracks (PlaylistID, AudioID)
VALUES
    (1, 1), -- John's Playlist 1
    (1, 2), -- John's Playlist 1
    (1, 3), -- John's Playlist 1
    (2, 4), -- Jane's Playlist 1
    (2, 5), -- Jane's Playlist 1
    (3, 6), -- Mike's Playlist 1
    (4, 7), -- Emily's Playlist 1
    (5, 8), -- Daniel's Playlist 1
    (5, 9), -- Daniel's Playlist 1
    (5, 10), -- Daniel's Playlist 1
    (6, 11), -- Sophia's Playlist 1
    (6, 12), -- Sophia's Playlist 1
    (7, 13), -- David's Playlist 1
    (8, 14), -- Olivia's Playlist 1
    (9, 15), -- James's Playlist 1
    (10, 16), -- Isabella's Playlist 1
    (11, 17), -- Ethan's Playlist 1
    (12, 18), -- Ava's Playlist 1
    (13, 19), -- Logan's Playlist 1
    (14, 20), -- Emma's Playlist 1
    (15, 1), -- John's Playlist 2
    (15, 5), -- Jane's Playlist 2
    (16, 7), -- Mike's Playlist 2
    (17, 8), -- Emily's Playlist 2
    (17, 10), -- Daniel's Playlist 2
    (18, 12), -- Sophia's Playlist 2
    (19, 14), -- David's Playlist 2
    (19, 16), -- Olivia's Playlist 2
    (20, 18), -- James's Playlist 2
    (20, 20); -- Isabella's Playlist 2
GO
-- test data for UserFavorites
INSERT INTO UserFavorites (FavoriteID, UserID, AlbumID, AudioID)
VALUES
    (1, 1, 1, 1), -- John's favorite song from Album1
    (2, 1, 2, 3), -- John's favorite song from Album2
    (3, 2, 3, 5), -- Jane's favorite song from Album3
    (4, 3, 4, 7), -- Mike's favorite song from Album4
    (5, 4, 5, 9), -- Emily's favorite song from Album5
    (6, 5, 6, 11), -- Daniel's favorite song from Album6
    (7, 6, 7, 13), -- Sophia's favorite song from Album7
    (8, 7, 8, 15), -- David's favorite song from Album8
    (9, 8, 9, 17), -- Olivia's favorite song from Album9
    (10, 9, 10, 19); -- James's favorite song from Album10
GO

-- test data for UserSubscriptions

INSERT INTO UserSubscriptions (SubscriptionID, UserID, SubscriptionType, StartDate, EndDate, PaymentStatus)
VALUES
    (1, 1, 'Free', '2022-01-01', '2022-12-31', 'Paid'),
    (2, 2, 'Premium', '2022-02-15', '2023-02-14', 'Paid'),
    (3, 3, 'Free', '2022-03-01', '2023-02-28', 'Unpaid'),
    (4, 4, 'Premium', '2022-04-10', '2023-04-09', 'Paid'),
    (5, 5, 'Free', '2022-05-15', '2023-05-14', 'Paid'),
    (6, 6, 'Premium', '2022-06-01', '2023-05-31', 'Paid'),
    (7, 7, 'Free', '2022-07-10', '2023-07-09', 'Paid'),
    (8, 8, 'Premium', '2022-08-20', '2023-08-19', 'Unpaid'),
    (9, 9, 'Free', '2022-09-01', '2023-08-31', 'Paid'),
    (10, 10, 'Premium', '2022-10-15', '2023-10-14', 'Paid');