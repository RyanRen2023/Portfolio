drop sequence userid_seq;
create sequence userid_seq start with 100 increment by 1;
drop sequence subscriptionid_seq;
create sequence subscriptionid_seq start with 100 increment by 1;

CREATE OR REPLACE EDITIONABLE TRIGGER "DBO"."USERSUBSCRIPTIONS_VIEW_TRIGGER" INSTEAD OF
    INSERT OR UPDATE OR DELETE ON usersubscriptions_view
    FOR EACH ROW
DECLARE
    n_userid NUMBER;
    v_cnt    NUMBER;
BEGIN
    CASE
        WHEN inserting THEN
            INSERT INTO users (
                userid,
                username,
                email,
                country
            ) VALUES (
                :new.userid,
                :new.username,
                :new.email,
                :new.country
            );
        --insert to usersubscription
            INSERT INTO usersubscriptions (
                subscriptionid,
                userid,
                subscriptiontype,
                startdate,
                enddate,
                paymentstatus
            ) VALUES (
                subscriptionid_seq.NEXTVAL,
                :new.userid,
                :new.subscriptiontype,
                TO_DATE(:new.startdate, 'yyyy-mm-dd'),
                TO_DATE(:new.enddate, 'yyyy-mm-dd'),
                :new.paymentstatus
            );

        WHEN updating THEN
            UPDATE users
            SET
                username = :new.username,
                email = :new.email,
                country = :new.country
            WHERE
                userid = :new.userid;

            IF :new.subscriptionid IS NOT NULL THEN
                SELECT
                    COUNT(*)
                INTO v_cnt
                FROM
                    usersubscriptions
                WHERE
                    subscriptionid = :new.subscriptionid;

                IF v_cnt > 0 THEN
                    UPDATE usersubscriptions
                    SET
                        subscriptiontype = :new.subscriptiontype,
                        userid = :new.userid,
                        startdate = TO_DATE(:new.startdate, 'yyyy-mm-dd'),
                        enddate = TO_DATE(:new.enddate, 'yyyy-mm-dd'),
                        paymentstatus = :new.paymentstatus
                    WHERE
                            subscriptionid = :new.subscriptionid
                        AND userid = :new.userid;

                ELSE
                    INSERT INTO usersubscriptions VALUES (
                        :new.subscriptionid,
                        :new.userid,
                        :new.subscriptiontype,
                        TO_DATE(:new.startdate, 'yyyy-mm-dd'),
                        TO_DATE(:new.enddate, 'yyyy-mm-dd'),
                        :new.paymentstatus
                    );

                END IF;

            END IF;

        WHEN deleting THEN
            DELETE FROM usersubscriptions
            WHERE
                userid = :old.userid;

            DELETE FROM users
            WHERE
                userid = :old.userid;

    END CASE;
END;
/