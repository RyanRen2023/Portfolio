-- execute under sqlplus
--conn dbo/dboPassword

-- create view usersubscriptions_view;

CREATE OR REPLACE VIEW usersubscriptions_view AS
    SELECT
        u.userid,
        u.username,
        u.email,
        u.country,
        us.subscriptionid,
        us.subscriptiontype,
        us.startdate,
        us.enddate,
        us.paymentstatus
    FROM
        users             u
        LEFT JOIN usersubscriptions us ON ( u.userid = us.userid );
        
-- 
CREATE OR REPLACE VIEW userfavoritesongs_view AS
    SELECT
        u.userid,
        u.username,
        u.email,
        u.country,
        a.albumid,
        a.title AS albumtitle,
        aat.audioid,
        aat.title AS audiotitle
    FROM
        users            u
        LEFT JOIN userfavorites    uf ON u.userid = uf.userid
        JOIN albums           a ON uf.albumid = a.albumid
        JOIN albumaudiotracks aat ON uf.audioid = aat.audioid;
-- CREATE VIEW AlbumDetails_View

CREATE OR REPLACE VIEW albumdetails_view AS
    SELECT
        a.albumid,
        a.title,
        a.releasedate,
        ac.categoryname,
        COUNT(at.audioid) AS trackcount
    FROM
             albums a
        JOIN albumcategories  ac ON a.categoryid = ac.categoryid
        LEFT JOIN albumaudiotracks at ON a.albumid = at.albumid
    GROUP BY
        a.albumid,
        a.title,
        a.releasedate,
        ac.categoryname;
        
-- CREATE or replace VIEW UserPlaylists_View 

CREATE OR REPLACE VIEW userplaylists_view AS
    SELECT
        up.playlistid,
        u.username AS userid,
        up.title,
        up.creationdate
    FROM
             userplaylists up
        JOIN users u ON up.userid = u.userid;
        







