-----------------------------------------------UserFavorites_Trigger-------------------------------------------------------

-- Drop the existing sequence and recreate it
DROP SEQUENCE uf_history_id_seq;
CREATE SEQUENCE uf_history_id_seq START WITH 1 INCREMENT BY 1;

-- Create a stored procedure: Insert into UserFavorites_History
CREATE OR REPLACE PROCEDURE sp_InsertIntoUserFavoritesHistory (
    p_HistoryID IN UserFavorites_History.HistoryID%TYPE,
    p_FavoriteID IN UserFavorites.FavoriteID%TYPE,
    p_UserID IN UserFavorites.UserID%TYPE,
    p_AlbumID IN UserFavorites.AlbumID%TYPE,
    p_AudioID IN UserFavorites.AudioID%TYPE,
    p_Action IN VARCHAR2,
    p_ActionTimestamp IN TIMESTAMP
)
IS
BEGIN
    INSERT INTO UserFavorites_History (HistoryID, FavoriteID, UserID, AlbumID, AudioID, Action, ActionTimestamp)
    VALUES (p_HistoryID, p_FavoriteID, p_UserID, p_AlbumID, p_AudioID, p_Action, p_ActionTimestamp);
END;
/

-- Create a trigger for the UserFavorites table
CREATE OR REPLACE TRIGGER UserFavorites_Trigger
AFTER INSERT OR UPDATE OR DELETE ON UserFavorites
FOR EACH ROW
DECLARE
    v_Action VARCHAR2(10);
BEGIN
    CASE
        WHEN INSERTING THEN
            v_Action := 'insert';
            sp_InsertIntoUserFavoritesHistory(uf_history_id_seq.NEXTVAL, :NEW.FavoriteID, :NEW.UserID, :NEW.AlbumID, :NEW.AudioID, v_Action, SYSTIMESTAMP);
        WHEN UPDATING THEN
            v_Action := 'update';
            sp_InsertIntoUserFavoritesHistory(uf_history_id_seq.NEXTVAL, :NEW.FavoriteID, :NEW.UserID, :NEW.AlbumID, :NEW.AudioID, v_Action, SYSTIMESTAMP);
        WHEN DELETING THEN
            v_Action := 'delete';
            sp_InsertIntoUserFavoritesHistory(uf_history_id_seq.NEXTVAL, :OLD.FavoriteID, :OLD.UserID, :OLD.AlbumID, :OLD.AudioID, v_Action, SYSTIMESTAMP);
    END CASE;
END;
/

-----------------------------------------------UserSubscriptions_Trigger-------------------------------------------------------

-- Drop the existing sequence and recreate it
DROP SEQUENCE us_history_id_seq;
CREATE SEQUENCE us_history_id_seq START WITH 1 INCREMENT BY 1;

-- Create a stored procedure: Insert into UserSubscriptions_History
CREATE OR REPLACE PROCEDURE sp_InsertIntoUserSubscriptionsHistory (
    p_HistoryID IN UserSubscriptions_History.HistoryID%TYPE,
    p_SubscriptionID IN UserSubscriptions.SubscriptionID%TYPE,
    p_UserID IN UserSubscriptions.UserID%TYPE,
    p_SubscriptionType IN UserSubscriptions.SubscriptionType%TYPE,
    p_StartDate IN UserSubscriptions.StartDate%TYPE,
    p_EndDate IN UserSubscriptions.EndDate%TYPE,
    p_PaymentStatus IN UserSubscriptions.PaymentStatus%TYPE,
    p_Action IN VARCHAR2,
    p_ActionTimestamp IN TIMESTAMP
)
IS
BEGIN
    -- Insert data into the UserSubscriptions_History table
    INSERT INTO UserSubscriptions_History (HistoryID, SubscriptionID, UserID, SubscriptionType, StartDate, EndDate, PaymentStatus, Action, ActionTimestamp)
    VALUES (p_HistoryID, p_SubscriptionID, p_UserID, p_SubscriptionType, p_StartDate, p_EndDate, p_PaymentStatus, p_Action, p_ActionTimestamp);
END;
/

-- Create a trigger for the UserSubscriptions table
CREATE OR REPLACE TRIGGER UserSubscriptions_Trigger
AFTER INSERT OR UPDATE OR DELETE ON UserSubscriptions
FOR EACH ROW
DECLARE
    v_Action VARCHAR2(10);
BEGIN
    -- Determine the type of action (insert, update, or delete)
    CASE
        WHEN INSERTING THEN
            v_Action := 'insert';
            sp_InsertIntoUserSubscriptionsHistory(us_history_id_seq.NEXTVAL, :NEW.SubscriptionID, :NEW.UserID, :NEW.SubscriptionType, :NEW.StartDate, :NEW.EndDate, :NEW.PaymentStatus, v_Action, SYSTIMESTAMP);
        WHEN UPDATING THEN
            v_Action := 'update';
            sp_InsertIntoUserSubscriptionsHistory(us_history_id_seq.NEXTVAL, :NEW.SubscriptionID, :NEW.UserID, :NEW.SubscriptionType, :NEW.StartDate, :NEW.EndDate, :NEW.PaymentStatus, v_Action, SYSTIMESTAMP);
        WHEN DELETING THEN
            v_Action := 'delete';
            sp_InsertIntoUserSubscriptionsHistory(us_history_id_seq.NEXTVAL, :OLD.SubscriptionID, :OLD.UserID, :OLD.SubscriptionType, :OLD.StartDate, :OLD.EndDate, :OLD.PaymentStatus, v_Action, SYSTIMESTAMP);

    END CASE;
END;
/


-----------------------------------------------Users_Trigger-------------------------------------------------------
-- Drop existing sequence and recreate
DROP SEQUENCE u_history_id_seq;
CREATE SEQUENCE u_history_id_seq START WITH 1 INCREMENT BY 1;

-- Create procedure: sp_InsertIntoUsersHistory
CREATE OR REPLACE PROCEDURE sp_InsertIntoUsersHistory (
    p_HistoryID IN Users_History.HistoryID%TYPE,
    p_UserID IN Users.UserID%TYPE,
    p_Username IN Users.Username%TYPE,
    p_Email IN Users.Email%TYPE,
    p_Country IN Users.Country%TYPE,
    p_Action IN VARCHAR2,
    p_ActionTimestamp IN TIMESTAMP
)
IS
BEGIN
    INSERT INTO Users_History (HistoryID, UserID, Username, Email, Country, Action, ActionTimestamp)
    VALUES (p_HistoryID, p_UserID, p_Username, p_Email, p_Country, p_Action, p_ActionTimestamp);
END;
/

-- Trigger for Users table
CREATE OR REPLACE TRIGGER Users_Trigger
AFTER INSERT OR UPDATE OR DELETE ON Users
FOR EACH ROW
DECLARE
    v_Action VARCHAR2(10);
BEGIN
    -- Determine the action type
    CASE
        WHEN INSERTING THEN
            v_Action := 'insert';
            -- Call the procedure to insert into history table for INSERT operation
            sp_InsertIntoUsersHistory(u_history_id_seq.NEXTVAL, :NEW.UserID, :NEW.Username, :NEW.Email, :NEW.Country, v_Action, SYSTIMESTAMP);
        WHEN UPDATING THEN
            v_Action := 'update';
            sp_InsertIntoUsersHistory(u_history_id_seq.NEXTVAL, :NEW.UserID, :NEW.Username, :NEW.Email, :NEW.Country, v_Action, SYSTIMESTAMP);
        WHEN DELETING THEN
            v_Action := 'delete';
            sp_InsertIntoUsersHistory(u_history_id_seq.NEXTVAL, :OLD.UserID, :OLD.Username, :OLD.Email, :OLD.Country, v_Action, SYSTIMESTAMP);
    END CASE;
END;
/


-----------------------------------------------Albums_Trigger-------------------------------------------------------
-- Drop existing sequence and recreate
DROP SEQUENCE ab_history_id_seq;
CREATE SEQUENCE ab_history_id_seq START WITH 1 INCREMENT BY 1;

-- Stored procedure for inserting into Albums_History
CREATE OR REPLACE PROCEDURE sp_InsertIntoAlbumsHistory (
    p_HistoryID IN Albums_History.HistoryID%TYPE,
    p_AlbumID IN Albums.AlbumID%TYPE,
    p_Title IN Albums.Title%TYPE,
    p_ReleaseDate IN Albums.ReleaseDate%TYPE,
    p_CategoryID IN Albums.CategoryID%TYPE,
    p_Action IN VARCHAR2,
    p_ActionTimestamp IN TIMESTAMP
)
IS
BEGIN
    INSERT INTO Albums_History (HistoryID, AlbumID, Title, ReleaseDate, CategoryID, Action, ActionTimestamp)
    VALUES (p_HistoryID, p_AlbumID, p_Title, p_ReleaseDate, p_CategoryID, p_Action, p_ActionTimestamp);
END;
/

-- Trigger for Albums table
CREATE OR REPLACE TRIGGER Albums_Trigger
AFTER INSERT OR UPDATE OR DELETE ON Albums
FOR EACH ROW
DECLARE
    v_Action VARCHAR2(10);
BEGIN
    -- Determine the action type
    CASE
        WHEN INSERTING THEN
            v_Action := 'insert';
            sp_InsertIntoAlbumsHistory(ab_history_id_seq.NEXTVAL, :NEW.AlbumID, :NEW.Title, :NEW.ReleaseDate, :NEW.CategoryID, v_Action, SYSTIMESTAMP);
        WHEN UPDATING THEN
            v_Action := 'update';
            sp_InsertIntoAlbumsHistory(ab_history_id_seq.NEXTVAL, :NEW.AlbumID, :NEW.Title, :NEW.ReleaseDate, :NEW.CategoryID, v_Action, SYSTIMESTAMP);
        WHEN DELETING THEN
            v_Action := 'delete';
            sp_InsertIntoAlbumsHistory(ab_history_id_seq.NEXTVAL, :OLD.AlbumID, :OLD.Title, :OLD.ReleaseDate, :OLD.CategoryID, v_Action, SYSTIMESTAMP);
    END CASE;

END;
/


-----------------------------------------------Authors_Trigger-------------------------------------------------------
-- create sequence
DROP SEQUENCE au_history_id_seq;
CREATE SEQUENCE au_history_id_seq START WITH 1 INCREMENT BY 1;

-- create procedure sp_InsertIntoAuthorsHistory
CREATE OR REPLACE PROCEDURE sp_InsertIntoAuthorsHistory (
    p_HistoryID IN Authors_History.HistoryID%TYPE,
    p_AuthorID IN Authors.AuthorID%TYPE,
    p_AuthorName IN Authors.AuthorName%TYPE,
    p_Country IN Authors.Country%TYPE,
    p_Action IN VARCHAR2,
    p_ActionTimestamp IN TIMESTAMP
)
IS
BEGIN
    INSERT INTO Authors_History (HistoryID, AuthorID, AuthorName, Country, Action, ActionTimestamp)
    VALUES (p_HistoryID, p_AuthorID, p_AuthorName, p_Country, p_Action, p_ActionTimestamp);
END;
/


-- Trigger for Authors table
CREATE OR REPLACE TRIGGER Authors_Trigger
AFTER INSERT OR UPDATE OR DELETE ON Authors
FOR EACH ROW
DECLARE
    v_Action VARCHAR2(10);
BEGIN
    CASE
        WHEN INSERTING THEN
            v_Action := 'insert';
            sp_InsertIntoAuthorsHistory(au_history_id_seq.NEXTVAL, :NEW.AuthorID, :NEW.AuthorName, :NEW.Country, v_Action, SYSTIMESTAMP);
        WHEN UPDATING THEN
            v_Action := 'update';
            sp_InsertIntoAuthorsHistory(au_history_id_seq.NEXTVAL, :NEW.AuthorID, :NEW.AuthorName, :NEW.Country, v_Action, SYSTIMESTAMP);
        WHEN DELETING THEN
            v_Action := 'delete';
            sp_InsertIntoAuthorsHistory(au_history_id_seq.NEXTVAL, :OLD.AuthorID, :OLD.AuthorName, :OLD.Country, v_Action, SYSTIMESTAMP);
    END CASE;

   
END;
/


