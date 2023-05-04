-- 12.1.0.4 to 12.1.1 ---------------------------------------------------------

CREATE OR REPLACE FUNCTION get_utc_epoch ( p_date IN TIMESTAMP ) RETURN NUMBER AS
BEGIN
    RETURN ( CAST ( p_date AT TIME ZONE 'UTC' AS DATE ) - DATE '1970-01-01' ) * 86400000;
END get_utc_epoch;
/


ALTER TABLE Organisations add createdDateEpoch NUMBER;
ALTER TABLE Users add createdDateEpoch NUMBER;
ALTER TABLE Folders add createdDateEpoch NUMBER add lastModifiedDateEpoch NUMBER;
ALTER TABLE DataDefinitions add createdDateEpoch NUMBER add lastModifiedDateEpoch NUMBER;
ALTER TABLE DataDefinitionFields add createdDateEpoch NUMBER;
ALTER TABLE JourneyFiles add createdDateEpoch NUMBER;
ALTER TABLE EntrySources add createdDateEpoch NUMBER add lastModifiedDateEpoch NUMBER;
ALTER TABLE FileEntrySourceFile add createdDateEpoch NUMBER;
ALTER TABLE journeys add createdDateEpoch NUMBER add lastModifiedDateEpoch NUMBER add publishDateEpoch NUMBER add pausedDateEpoch NUMBER add completedDateEpoch NUMBER;
ALTER TABLE JourneyAssociations add createdDateEpoch NUMBER;
ALTER TABLE Point add createdDateEpoch NUMBER add lastModifiedDateEpoch NUMBER;
ALTER TABLE DelayActionPoint add waitTillDateEpoch NUMBER;
ALTER TABLE EngagementSplitActionPoint add waitTillDateEpoch NUMBER;
ALTER TABLE DeliverMetaData add createdDateEpoch NUMBER add lastModifiedDateEpoch NUMBER;
ALTER TABLE PointEntrySourceAssociation add createdDateEpoch NUMBER;
ALTER TABLE JourneyAudiences add createdDateEpoch NUMBER;
ALTER TABLE JourneyDataErrors add createdDateEpoch NUMBER;
ALTER TABLE journeyState add createdDateEpoch NUMBER;
ALTER TABLE entrySourceJourneyMap add createdDateEpoch NUMBER;
ALTER TABLE PausedJourneys add createdDateEpoch NUMBER;
ALTER TABLE AudienceResponseEventMaster add createdDateEpoch NUMBER;
ALTER TABLE AudienceResponse add createdDateEpoch NUMBER add responseTimeEpoch NUMBER modify (responseTime NULL);
ALTER TABLE JourneyAudienceFlow add createdDateEpoch NUMBER add logTimeStampEpoch NUMBER;
ALTER TABLE JourneyFlow add createdDateEpoch NUMBER;
ALTER TABLE JourneyDiscardedData add createdDateEpoch NUMBER;
ALTER TABLE StreamingDataLog add createdDateEpoch NUMBER;
ALTER TABLE DataDefinitionSchema add createdDateEpoch NUMBER;
ALTER TABLE ExternalAppConfiguration add createdDateEpoch NUMBER add lastModifiedDateEpoch NUMBER;
ALTER TABLE DefaultConnection add createdDateEpoch NUMBER add lastModifiedDateEpoch NUMBER;
ALTER TABLE AudienceResponseMetaData add createdDateEpoch NUMBER add responseTimeEpoch NUMBER modify (responseTime null);
ALTER TABLE AudienceCount add createdDateEpoch NUMBER;
ALTER TABLE TouchPointBatches add createdDateEpoch NUMBER;
ALTER TABLE BatchIDAudiencedataMap add createdDateEpoch NUMBER;
ALTER TABLE JourneyDateFormat add createdDateEpoch NUMBER;
ALTER TABLE JourneyDeliverResponseMaster add createdDateEpoch NUMBER add responseTimeEpoch NUMBER add updatedDateEpoch NUMBER;
ALTER TABLE JourneyDeliverResponseEvent add createdDateEpoch NUMBER add responseTimeEpoch NUMBER add updatedDateEpoch NUMBER;
ALTER TABLE JourneyDeliverResponseLink add createdDateEpoch NUMBER add responseTimeEpoch NUMBER;
ALTER TABLE AudienceResponseInteraction add createdDateEpoch NUMBER;
ALTER TABLE TemplateLinks add createdDateEpoch NUMBER;
ALTER TABLE JourneyTouchPoints add createdDateEpoch NUMBER;
ALTER TABLE JourneyGoalMaster add createdDateEpoch NUMBER add updatedDateEpoch NUMBER add completedDateEpoch NUMBER;
ALTER TABLE JourneyGoalDate add targetDateTimeEpoch NUMBER;
ALTER TABLE JourneyGoalContactVersions add createdDateEpoch NUMBER add updatedDateEpoch NUMBER;
ALTER TABLE JourneyGoalSalesVersions add createdDateEpoch NUMBER add updatedDateEpoch NUMBER;
ALTER TABLE JourneyGoalContactTransaction add createdDateEpoch NUMBER;
ALTER TABLE JourneyGoalSalesTransaction add createdDateEpoch NUMBER;
ALTER TABLE JourneyAudienceGoal add createdDateEpoch NUMBER add responsetimeEpoch NUMBER;
ALTER TABLE AudienceBulkResponse add createdDateEpoch NUMBER add responseTimeEpoch NUMBER add modifiedDateEpoch NUMBER modify (responseTime null);
ALTER TABLE ContextSensitiveUrls add createdDateEpoch NUMBER add modifiedDateEpoch NUMBER;
ALTER TABLE JourneyMilestone add createdDateEpoch NUMBER add targetAchievedDateEpoch NUMBER;
ALTER TABLE MilestoneAssociation add createdDateEpoch NUMBER;
ALTER TABLE LinkMetaData add createdDateEpoch NUMBER add lastModifiedDateEpoch NUMBER;
ALTER TABLE JourneyAudienceMilestone add createdDateEpoch NUMBER add achievedDateEpoch NUMBER add journeyEnteredDateEpoch NUMBER;

UPDATE Organisations SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE Users SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE Folders SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE Folders SET lastModifiedDateEpoch = get_utc_epoch(lastModifiedDate) WHERE lastModifiedDateEpoch IS NULL AND lastModifiedDate IS NOT NULL;
UPDATE DataDefinitions SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE DataDefinitions SET lastModifiedDateEpoch = get_utc_epoch(lastModifiedDate) WHERE lastModifiedDateEpoch IS NULL AND lastModifiedDate IS NOT NULL;
UPDATE DataDefinitionFields SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyFiles SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE EntrySources SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE EntrySources SET lastModifiedDateEpoch = get_utc_epoch(lastModifiedDate) WHERE lastModifiedDateEpoch IS NULL AND lastModifiedDate IS NOT NULL; 
UPDATE FileEntrySourceFile SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE journeys SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE journeys SET lastModifiedDateEpoch = get_utc_epoch(lastModifiedDate) WHERE lastModifiedDateEpoch IS NULL AND lastModifiedDate IS NOT NULL;
UPDATE journeys SET publishDateEpoch = get_utc_epoch(publishDate) WHERE publishDateEpoch IS NULL AND publishDate IS NOT NULL;
UPDATE journeys SET pausedDateEpoch = get_utc_epoch(pausedDate) WHERE pausedDateEpoch IS NULL AND pausedDate IS NOT NULL;
UPDATE journeys SET completedDateEpoch = get_utc_epoch(completedDate) WHERE completedDateEpoch IS NULL AND completedDate IS NOT NULL;
UPDATE JourneyAssociations SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE Point SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE Point SET lastModifiedDateEpoch = get_utc_epoch(lastModifiedDate) WHERE lastModifiedDateEpoch IS NULL AND lastModifiedDate IS NOT NULL;
UPDATE DelayActionPoint SET waitTillDateEpoch = get_utc_epoch(waitTillDate) WHERE waitTillDateEpoch IS NULL AND waitTillDate IS NOT NULL;
UPDATE EngagementSplitActionPoint SET waitTillDateEpoch = get_utc_epoch(waitTillDate) WHERE waitTillDateEpoch IS NULL AND waitTillDate IS NOT NULL;
UPDATE DeliverMetaData SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE DeliverMetaData SET lastModifiedDateEpoch = get_utc_epoch(lastModifiedDate) WHERE lastModifiedDateEpoch IS NULL AND lastModifiedDate IS NOT NULL;
UPDATE PointEntrySourceAssociation SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyAudiences SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyDataErrors SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE journeyState SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE entrySourceJourneyMap SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE PausedJourneys SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE AUDIENCERESPONSEEVENTMASTER SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE AudienceResponse SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE AudienceResponse SET responseTimeEpoch = get_utc_epoch(responseTime) WHERE responseTimeEpoch IS NULL AND responseTime IS NOT NULL;
UPDATE JourneyAudienceFlow SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyAudienceFlow SET logTimeStampEpoch = get_utc_epoch(logTimeStamp) WHERE logTimeStampEpoch IS NULL AND logTimeStamp IS NOT NULL;
UPDATE JourneyFlow SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyDiscardedData SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE StreamingDataLog SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE DataDefinitionSchema SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE ExternalAppConfiguration SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE ExternalAppConfiguration SET lastModifiedDateEpoch = get_utc_epoch(lastModifiedDate) WHERE lastModifiedDateEpoch IS NULL AND lastModifiedDate IS NOT NULL;
UPDATE DefaultConnection SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE DefaultConnection SET lastModifiedDateEpoch = get_utc_epoch(lastModifiedDate) WHERE lastModifiedDateEpoch IS NULL AND lastModifiedDate IS NOT NULL;
UPDATE AudienceResponseMetaData SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE AudienceResponseMetaData SET responseTimeEpoch = get_utc_epoch(responseTime) WHERE responseTimeEpoch IS NULL AND responseTime IS NOT NULL;
UPDATE AudienceCount SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE TouchPointBatches SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE BatchIDAudiencedataMap SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyDateFormat SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyDeliverResponseMaster SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyDeliverResponseMaster SET responseTimeEpoch = get_utc_epoch(responseTime) WHERE responseTimeEpoch IS NULL AND responseTime IS NOT NULL;
UPDATE JourneyDeliverResponseMaster SET updatedDateEpoch = get_utc_epoch(updatedDate) WHERE updatedDateEpoch IS NULL AND updatedDate IS NOT NULL;
UPDATE JourneyDeliverResponseEvent SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyDeliverResponseEvent SET responseTimeEpoch = get_utc_epoch(responseTime) WHERE responseTimeEpoch IS NULL AND responseTime IS NOT NULL;
UPDATE JourneyDeliverResponseEvent SET updatedDateEpoch = get_utc_epoch(updatedDate) WHERE updatedDateEpoch IS NULL AND updatedDate IS NOT NULL;
UPDATE JourneyDeliverResponseLink SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyDeliverResponseLink SET responseTimeEpoch = get_utc_epoch(responseTime) WHERE responseTimeEpoch IS NULL AND responseTime IS NOT NULL;
UPDATE AudienceResponseInteraction SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE TemplateLinks SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyTouchPoints SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyGoalMaster SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyGoalMaster SET updatedDateEpoch = get_utc_epoch(updatedDate) WHERE updatedDateEpoch IS NULL AND updatedDate IS NOT NULL;
UPDATE JourneyGoalMaster SET completedDateEpoch = get_utc_epoch(completedDate) WHERE completedDateEpoch IS NULL AND completedDate IS NOT NULL;
UPDATE JourneyGoalDate SET targetDateTimeEpoch = get_utc_epoch(targetDateTime) WHERE targetDateTimeEpoch IS NULL AND targetDateTime IS NOT NULL;
UPDATE JourneyGoalContactVersions SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyGoalContactVersions SET updatedDateEpoch = get_utc_epoch(updatedDate) WHERE updatedDateEpoch IS NULL AND updatedDate IS NOT NULL;
UPDATE JourneyGoalSalesVersions SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyGoalSalesVersions SET updatedDateEpoch = get_utc_epoch(updatedDate) WHERE updatedDateEpoch IS NULL AND updatedDate IS NOT NULL;
UPDATE JourneyGoalContactTransaction SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyGoalSalesTransaction SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyAudienceGoal SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE AudienceBulkResponse SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE AudienceBulkResponse SET responseTimeEpoch = get_utc_epoch(responseTime) WHERE responseTimeEpoch IS NULL AND responseTime IS NOT NULL;
UPDATE AudienceBulkResponse SET modifiedDateEpoch = get_utc_epoch(modifiedDate) WHERE modifiedDateEpoch IS NULL AND modifiedDate IS NOT NULL;
UPDATE CONTEXTSENSITIVEURLS SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE CONTEXTSENSITIVEURLS SET modifiedDateEpoch = get_utc_epoch(modifiedDate) WHERE modifiedDateEpoch IS NULL AND modifiedDate IS NOT NULL;
UPDATE JourneyMilestone SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyMilestone SET targetAchievedDateEpoch = get_utc_epoch(targetAchievedDate) WHERE targetAchievedDateEpoch IS NULL AND targetAchievedDate IS NOT NULL;
UPDATE MilestoneAssociation SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE LinkMetaData SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE LinkMetaData SET lastModifiedDateEpoch = get_utc_epoch(lastModifiedDate) WHERE lastModifiedDateEpoch IS NULL AND lastModifiedDate IS NOT NULL;
UPDATE JourneyAudienceMilestone SET createdDateEpoch = get_utc_epoch(createdDate) WHERE createdDateEpoch IS NULL AND createdDate IS NOT NULL;
UPDATE JourneyAudienceMilestone SET achievedDateEpoch = get_utc_epoch(achievedDate) WHERE achievedDateEpoch IS NULL AND achievedDate IS NOT NULL;
UPDATE JourneyAudienceMilestone SET journeyEnteredDateEpoch = get_utc_epoch(journeyEnteredDate) WHERE journeyEnteredDateEpoch IS NULL AND journeyEnteredDate IS NOT NULL;

ALTER TABLE AudienceBulkResponse MODIFY ( responseTimeEpoch NOT NULL);
ALTER TABLE AudienceResponse MODIFY ( responseTimeEpoch NOT NULL);
ALTER TABLE AudienceResponseMetaData MODIFY ( responseTimeEpoch NOT NULL);

-- *****************************************************************
-- This function is used to get UTC epoch millis 
-- Returns NUMBER
-- *****************************************************************
create or replace  FUNCTION get_utc_epoch RETURN NUMBER AS
BEGIN
    RETURN ( CAST ( systimestamp AT TIME ZONE 'UTC' AS DATE ) - DATE '1970-01-01' ) * 86400000;
END get_utc_epoch;
/

-- *****************************************************************
-- This function is used to get UTC date 
-- Returns TIMESTAMP
-- *****************************************************************
create or replace  FUNCTION get_utc_date RETURN TIMESTAMP AS
BEGIN
    RETURN systimestamp AT TIME ZONE 'UTC';
END get_utc_date;
/

-- *****************************************************************
-- This function is used to get TIMESTAMP from epoch millis 
-- @Param p_responsetime IN NUMBER
-- Returns TIMESTAMP
-- *****************************************************************
create or replace  FUNCTION get_date_from_utc_epoch (
    p_responsetime   IN   NUMBER
) RETURN TIMESTAMP AS
BEGIN
    return to_timestamp('1970-01-01 00:00:00.0', 'YYYY-MM-DD HH24:MI:SS.FF') + numtodsinterval(p_responsetime / 1000 / 60, 'MINUTE');
END get_date_from_utc_epoch;
/

-- *****************************************************************
-- This function is used to get Epoch Millis from Date 
-- @Param p_date IN TIMESTAMP 
-- Returns NUMBER
-- *****************************************************************
create or replace  FUNCTION get_utc_epoch_from_date (
    p_date IN TIMESTAMP
) RETURN NUMBER AS
BEGIN
    RETURN ( CAST ( p_date AT TIME ZONE 'UTC' AS DATE ) - DATE '1970-01-01' ) * 86400000;
END get_utc_epoch_from_date;
/

-- *****************************************************************
-- This procedure is used to process the journey goal based on every 
-- audience response. This procedure populate the goal transaction tables
-- which used in GOAL Analytics.
-- @Param AUDIENCEID IN,EVENTID INTOUCHPOINTID IN
-- *****************************************************************
create or replace  PROCEDURE process_journey_goals (
    p_audienceid     IN   NUMBER,
    p_eventid        IN   NUMBER,
    p_touchointid    IN   NUMBER,
    p_responsetime   NUMBER
) IS

    r_contact_goal                  journeygoalcontact%rowtype;
    r_jgct                          journeygoalcontacttransaction%rowtype;
    r_sales_goal                    journeygoalsales%rowtype;
    r_journeygoalsalestransaction   journeygoalsalestransaction%rowtype;
    v_count                         NUMBER(20);
    v_journeyid                     NUMBER(20);
    v_percentage                    NUMBER(6, 2);
    v_start_date                    TIMESTAMP;
    v_end_date                      TIMESTAMP;
    v_error_msg                     VARCHAR(500);
    v_targeturl                     VARCHAR(500);
    v_eventname                     VARCHAR(250);
    v_utcdate                       TIMESTAMP;
    v_utcepoch                      NUMBER;
    v_responsedate                  TIMESTAMP;
    CURSOR c_journeygoalmaster IS
    SELECT
        jgm.*
    FROM
        journeygoalmaster jgm
    WHERE
        jgm.journeyid = v_journeyid;

    r_journeygoalmaster             c_journeygoalmaster%rowtype;
BEGIN
    
    dbms_output.put_line('START : '
                         || p_audienceid
                         || ','
                         || p_eventid
                         || ','
                         || p_touchointid
                         || ','
                         || v_journeyid);

    dbms_output.put_line('GOALTYPE : '
                         || r_journeygoalmaster.goaltype
                         || ','
                         || r_journeygoalmaster.frequency);

    SELECT
        journeyid
    INTO v_journeyid
    FROM
        point
    WHERE
        id = p_touchointid;

    v_utcepoch := get_utc_epoch();
    v_utcdate := get_date_from_utc_epoch(v_utcepoch);
    v_responsedate := get_date_from_utc_epoch(p_responsetime);

    IF NOT c_journeygoalmaster%isopen THEN
        OPEN c_journeygoalmaster;
    END IF;
    LOOP
        FETCH c_journeygoalmaster INTO r_journeygoalmaster;
        EXIT WHEN c_journeygoalmaster%notfound;
        dbms_output.put_line('GOALTYPE : '
                             || r_journeygoalmaster.goaltype
                             || ','
                             || r_journeygoalmaster.frequency);

        IF r_journeygoalmaster.goaltype = 1 THEN
            SELECT
                displayname
            INTO v_eventname
            FROM
                audienceresponseeventmaster
            WHERE
                id = p_eventid;

            IF v_eventname NOT IN (
                'LINK_CLICK_EMAIL',
                'LINK_CLICK_SMS'
            ) THEN
                BEGIN
                    dbms_output.put_line('CONTACT BASED GOAL : '
                                         || r_journeygoalmaster.id
                                         || ','
                                         || p_touchointid
                                         || ','
                                         || p_eventid);
          -- FETCH JOURNEY_GOAL_CONTACT DETAILS

                    SELECT
                        jgc.*
                    INTO r_contact_goal
                    FROM
                        journeygoalcontact jgc
                    WHERE
                        targettouchpointid = p_touchointid
                        AND targeteventid = p_eventid
                        AND id = r_journeygoalmaster.id
                        AND targetlink IS NULL;
          -- POPULATE JOURNEYGOALCONTACTTRANSACTIONS TABLE BASED ON FREQUENCY

                    IF r_journeygoalmaster.flagfrequencyenabled = 0 THEN
                        dbms_output.put_line('FREQUENCY IS NULL : ' || r_contact_goal.id);
                        BEGIN
                            SELECT
                                jgct.*
                            INTO r_jgct
                            FROM
                                journeygoalcontacttransaction jgct
                            WHERE
                                journeygoalcontactid = r_contact_goal.id;

                        EXCEPTION
                            WHEN no_data_found THEN
                                dbms_output.put_line('NO_DATA_FOUND IN JOURNEYGOALCONTACTTRANSACTIONS');
                                INSERT INTO journeygoalcontacttransaction (
                                    journeygoalcontactid,
                                    startdate,
                                    enddate,
                                    percentage,
                                    currentaudiencecount,
                                    version,
                                    createddate,
                                    createddateepoch
                                ) VALUES (
                                    r_contact_goal.id,
                                    NULL,
                                    NULL,
                                    0.00,
                                    0,
                                    0,
                                    v_utcdate,
                                    v_utcepoch
                                );

                                SELECT
                                    jgct.*
                                INTO r_jgct
                                FROM
                                    journeygoalcontacttransaction jgct
                                WHERE
                                    journeygoalcontactid = r_contact_goal.id;

                        END;
            -- CALCULATE COUNT and PERCENTAGE

                        v_count := r_jgct.currentaudiencecount + 1;
                        v_percentage := ( v_count * 100 ) / r_contact_goal.targetaudiencecount;
            -- UPDATE COUNT and PERCENTAGE
                        UPDATE journeygoalcontacttransaction
                        SET
                            currentaudiencecount = v_count,
                            percentage = v_percentage
                        WHERE
                            journeygoalcontactid = r_contact_goal.id;

                    ELSE
                        dbms_output.put_line('FREQUENCY IS NOT NULL FOR CONTACT GOAL ID: '
                                             || r_contact_goal.id
                                             || ','
                                             || r_journeygoalmaster.frequency
                                             || ','
                                             || p_responsetime);
            -- SET START_DATE AND END_DATE

                        IF r_journeygoalmaster.frequency = 0 THEN
                            v_start_date := trunc(v_responsedate);
                            v_end_date := trunc(v_responsedate);
                        ELSIF r_journeygoalmaster.frequency = 1 THEN
                            SELECT
                                trunc(v_responsedate, 'DAY') + 1,
                                trunc(v_responsedate, 'DAY') + 7
                            INTO
                                v_start_date,
                                v_end_date
                            FROM
                                dual;

                        ELSIF r_journeygoalmaster.frequency = 2 THEN
                            SELECT
                                trunc(v_responsedate, 'MONTH'),
                                last_day(trunc(v_responsedate, 'MONTH'))
                            INTO
                                v_start_date,
                                v_end_date
                            FROM
                                dual;

                        ELSIF r_journeygoalmaster.frequency = 3 THEN
                            SELECT
                                trunc(v_responsedate, 'Q'),
                                last_day(add_months(trunc(v_responsedate, 'Q'), 2))
                            INTO
                                v_start_date,
                                v_end_date
                            FROM
                                dual;

                        END IF;

                        BEGIN
                            dbms_output.put_line('Frequency range : '
                                                 || v_start_date
                                                 || ','
                                                 || v_end_date
                                                 || ','
                                                 || r_contact_goal.id);
              -- FETCH JOURNEYGOALCONTACTTRANSACTIONS DETAILS

                            SELECT
                                jgct.*
                            INTO r_jgct
                            FROM
                                journeygoalcontacttransaction jgct
                            WHERE
                                journeygoalcontactid = r_contact_goal.id
                                AND startdate >= v_start_date
                                AND enddate <= v_end_date;

                        EXCEPTION
                            WHEN no_data_found THEN
                                dbms_output.put_line('NO_DATA_FOUND IN JOURNEYGOALCONTACTTRANSACTIONS' || r_contact_goal.id);
              -- INSERT DEFAULT TRANSACTION ENTRY FOR GIVEN FREQUENCY
                                INSERT INTO journeygoalcontacttransaction (
                                    journeygoalcontactid,
                                    startdate,
                                    enddate,
                                    percentage,
                                    currentaudiencecount,
                                    version,
                                    createddate,
                                    createddateepoch
                                ) VALUES (
                                    r_contact_goal.id,
                                    v_start_date,
                                    v_end_date,
                                    0.00,
                                    0,
                                    0,
                                    v_utcdate,
                                    v_utcepoch
                                );

                                SELECT
                                    jgct.*
                                INTO r_jgct
                                FROM
                                    journeygoalcontacttransaction jgct
                                WHERE
                                    journeygoalcontactid = r_contact_goal.id
                                    AND startdate >= v_start_date
                                    AND enddate <= v_end_date;

                        END;
            -- CALCULATE COUNT and PERCENTAGE

                        v_count := r_jgct.currentaudiencecount + 1;
                        v_percentage := ( v_count * 100 ) / r_contact_goal.targetaudiencecount;
            -- UPDATE COUNT and PERCENTAGE
                        UPDATE journeygoalcontacttransaction
                        SET
                            currentaudiencecount = v_count,
                            percentage = v_percentage
                        WHERE
                            journeygoalcontactid = r_contact_goal.id
                            AND startdate >= v_start_date
                            AND enddate <= v_end_date;

                    END IF;
          -- POPULATE JOURNEYAUDIENCEGOAL TABLE

                    INSERT INTO journeyaudiencegoal (
                        audienceid,
                        goalid,
                        goalstatus,
                        createddate,
                        createddateepoch,
                        responsetime,
                        responsetimeepoch,
                        version
                    ) VALUES (
                        p_audienceid,
                        r_journeygoalmaster.id,
                        'GOAL_INCOMPLETE',
                        v_utcdate,
                        v_utcepoch,
                        v_responsedate,
                        p_responsetime,
                        0
                    );

                EXCEPTION
                    WHEN no_data_found THEN
                        dbms_output.put_line('NO_DATA_FOUND IN JOURNEYGOALCONTACT');
                        v_error_msg := 'NO_DATA_FOUND IN JOURNEYGOALCONTACT :: '
                                       || p_audienceid
                                       || ','
                                       || p_eventid
                                       || ','
                                       || p_touchointid
                                       || ','
                                       || sqlerrm;

                        INSERT INTO journeydataerrors (
                            entrysourceid,
                            journeyid,
                            sourcetopic,
                            errormsg,
                            createddate,
                            createddateepoch,
                            version
                        ) VALUES (
                            p_audienceid,
                            v_journeyid,
                            'PROCESS_JOURNEY_GOALS',
                            v_error_msg,
                            v_utcdate,
                            v_utcepoch,
                            0
                        );

                END;

            END IF;

        ELSIF r_journeygoalmaster.goaltype = 2 THEN
            BEGIN
                dbms_output.put_line('SALES BASED GOAL : '
                                     || r_journeygoalmaster.id
                                     || ','
                                     || p_touchointid
                                     || ','
                                     || p_eventid);
        -- FETCH JOURNEY_GOAL_CONTACT DETAILS

                SELECT
                    jgs.*
                INTO r_sales_goal
                FROM
                    journeygoalsales jgs
                WHERE
                    id = r_journeygoalmaster.id
                    AND targettouchpointid = p_touchointid;
        -- POPULATE journeygoalsalestransactions TABLE BASED ON FREQUENCY

                IF r_journeygoalmaster.flagfrequencyenabled = 0 THEN
                    dbms_output.put_line('FREQUENCY IS NULL : ' || r_sales_goal.id);
                    BEGIN
                        SELECT
                            jgct.*
                        INTO r_journeygoalsalestransaction
                        FROM
                            journeygoalsalestransaction jgct
                        WHERE
                            journeygoalsalesid = r_sales_goal.id;

                    EXCEPTION
                        WHEN no_data_found THEN
                            dbms_output.put_line('NO_DATA_FOUND IN journeygoalsalestransaction');
                            INSERT INTO journeygoalsalestransaction (
                                journeygoalsalesid,
                                startdate,
                                enddate,
                                percentage,
                                currentaudiencecount,
                                version,
                                createddate,
                                createddateepoch
                            ) VALUES (
                                r_sales_goal.id,
                                NULL,
                                NULL,
                                0.00,
                                0,
                                0,
                                v_utcdate,
                                v_utcepoch
                            );

                            SELECT
                                jgct.*
                            INTO r_journeygoalsalestransaction
                            FROM
                                journeygoalsalestransaction jgct
                            WHERE
                                journeygoalsalesid = r_sales_goal.id;

                    END;
          -- CALCULATE COUNT and PERCENTAGE

                    v_count := r_journeygoalsalestransaction.currentaudiencecount + 1;
                    v_percentage := ( v_count * 100 ) / r_sales_goal.targetaudiencecount;
          -- UPDATE COUNT and PERCENTAGE
                    UPDATE journeygoalsalestransaction
                    SET
                        currentaudiencecount = v_count,
                        percentage = v_percentage
                    WHERE
                        journeygoalsalesid = r_sales_goal.id;

                ELSE
                    dbms_output.put_line('FREQUENCY IS NOT NULL FOR SALES GOAL ID: '
                                         || r_sales_goal.id
                                         || ','
                                         || r_journeygoalmaster.frequency
                                         || ','
                                         || p_responsetime);
          -- SET START_DATE AND END_DATE

                    IF r_journeygoalmaster.frequency = 0 THEN
                        v_start_date := trunc(v_responsedate);
                        v_end_date := trunc(v_responsedate);
                    ELSIF r_journeygoalmaster.frequency = 1 THEN
                        SELECT
                            trunc(v_responsedate, 'DAY') + 1,
                            trunc(v_responsedate, 'DAY') + 7
                        INTO
                            v_start_date,
                            v_end_date
                        FROM
                            dual;

                    ELSIF r_journeygoalmaster.frequency = 2 THEN
                        SELECT
                            trunc(v_responsedate, 'MONTH'),
                            last_day(trunc(v_responsedate, 'MONTH'))
                        INTO
                            v_start_date,
                            v_end_date
                        FROM
                            dual;

                    ELSIF r_journeygoalmaster.frequency = 3 THEN
                        SELECT
                            trunc(v_responsedate, 'Q'),
                            last_day(add_months(trunc(v_responsedate, 'Q'), 2))
                        INTO
                            v_start_date,
                            v_end_date
                        FROM
                            dual;

                    END IF;

                    BEGIN
                        dbms_output.put_line('Frequency range : '
                                             || v_start_date
                                             || ','
                                             || v_end_date
                                             || ','
                                             || r_sales_goal.id);
            -- FETCH r_journeygoalsalestransactions DETAILS

                        SELECT
                            jgst.*
                        INTO r_journeygoalsalestransaction
                        FROM
                            journeygoalsalestransaction jgst
                        WHERE
                            journeygoalsalesid = r_sales_goal.id
                            AND startdate >= v_start_date
                            AND enddate <= v_end_date;

                    EXCEPTION
                        WHEN no_data_found THEN
                            dbms_output.put_line('NO_DATA_FOUND IN journeygoalsalestransaction' || r_sales_goal.id);
            -- INSERT DEFAULT TRANSACTION ENTRY FOR GIVEN FREQUENCY
                            INSERT INTO journeygoalsalestransaction (
                                journeygoalsalesid,
                                startdate,
                                enddate,
                                percentage,
                                currentaudiencecount,
                                version,
                                createddate,
                                createddateepoch
                            ) VALUES (
                                r_sales_goal.id,
                                v_start_date,
                                v_end_date,
                                0.00,
                                0,
                                0,
                                v_utcdate,
                                v_utcepoch
                            );

                            SELECT
                                jgst.*
                            INTO r_journeygoalsalestransaction
                            FROM
                                journeygoalsalestransaction jgst
                            WHERE
                                journeygoalsalesid = r_sales_goal.id
                                AND startdate >= v_start_date
                                AND enddate <= v_end_date;

                    END;
          -- CALCULATE COUNT and PERCENTAGE

                    v_count := r_journeygoalsalestransaction.currentaudiencecount + 1;
                    v_percentage := ( v_count * 100 ) / r_sales_goal.targetaudiencecount;
          -- UPDATE COUNT and PERCENTAGE
                    UPDATE journeygoalsalestransaction
                    SET
                        currentaudiencecount = v_count,
                        percentage = v_percentage
                    WHERE
                        journeygoalsalesid = r_sales_goal.id
                        AND startdate >= v_start_date
                        AND enddate <= v_end_date;

                END IF;
        -- POPULATE JOURNEYAUDIENCEGOAL TABLE

                INSERT INTO journeyaudiencegoal (
                    audienceid,
                    goalid,
                    goalstatus,
                    createddate,
                    createddateepoch,
                    responsetime,
                    responsetimeepoch,
                    version
                ) VALUES (
                    p_audienceid,
                    r_journeygoalmaster.id,
                    'GOAL_INCOMPLETE',
                    v_utcdate,
                    v_utcepoch,
                    v_responsedate,
                    p_responsetime,
                    0
                );

            EXCEPTION
                WHEN no_data_found THEN
                    dbms_output.put_line('NO_DATA_FOUND IN JOURNEYGOALSALES');
                    v_error_msg := 'NO_DATA_FOUND IN JOURNEYGOALSALES :: '
                                   || p_audienceid
                                   || ','
                                   || p_eventid
                                   || ','
                                   || p_touchointid
                                   || ','
                                   || sqlerrm;

                    INSERT INTO journeydataerrors (
                        entrysourceid,
                        journeyid,
                        sourcetopic,
                        errormsg,
                        createddate,
                        createddateepoch,
                        version
                    ) VALUES (
                        p_audienceid,
                        v_journeyid,
                        'PROCESS_JOURNEY_GOALS',
                        v_error_msg,
                        v_utcdate,
                        v_utcepoch,
                        0
                    );

            END;
        END IF;

    END LOOP;

    CLOSE c_journeygoalmaster;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR IN PROCESS_JOURNEY_GOALS :: '
                             || p_audienceid
                             || ','
                             || p_eventid
                             || ','
                             || p_touchointid
                             || ','
                             || sqlerrm);

        v_error_msg := 'ERROR IN PROCESS_JOURNEY_GOALS :: '
                       || p_audienceid
                       || ','
                       || p_eventid
                       || ','
                       || p_touchointid
                       || ','
                       || sqlerrm;

        INSERT INTO journeydataerrors (
            entrysourceid,
            journeyid,
            sourcetopic,
            errormsg,
            createddate,
            createddateepoch,
            version
        ) VALUES (
            p_audienceid,
            v_journeyid,
            'PROCESS_JOURNEY_GOALS',
            v_error_msg,
            v_utcdate,
            v_utcepoch,
            0
        );

END process_journey_goals;
/

-- *****************************************************************
-- This procedure is used to process the journey goals on sms/email link click event based on every 
-- audience response. This procedure populate the goal transaction tables
-- which used in GOAL Analytics.
-- @Param p_audienceresponsemetaid IN ,p_link_url IN , p_responsetime IN
-- *****************************************************************
create or replace  PROCEDURE process_journey_goals_meta (
    p_audienceresponsemetaid   IN   NUMBER,
    p_link_url                 IN   VARCHAR2,
    p_responsetime             NUMBER
) IS

    r_contact_goal        journeygoalcontact%rowtype;
    r_jgct                journeygoalcontacttransaction%rowtype;
    v_audienceid          NUMBER(20);
    v_eventid             NUMBER(20);
    v_touchpointid        NUMBER(20);
    v_count               NUMBER(20);
    v_journeyid           NUMBER(20);
    v_percentage          NUMBER(6, 2);
    v_start_date          TIMESTAMP;
    v_end_date            TIMESTAMP;
    v_error_msg           VARCHAR(500);
    v_utcdate             TIMESTAMP;
    v_utcepoch            NUMBER;
    v_responsedate        TIMESTAMP;
    CURSOR c_journeygoalmaster IS
    SELECT
        jgm.*
    FROM
        journeygoalmaster jgm
    WHERE
        jgm.journeyid = v_journeyid;

    r_journeygoalmaster   c_journeygoalmaster%rowtype;
BEGIN
    dbms_output.put_line('P_AUDIENCERESPONSEMETAID : '
                         || p_audienceresponsemetaid
                         || ','
                         || p_link_url);
    SELECT
        audienceid,
        eventid,
        touchpointid
    INTO
        v_audienceid,
        v_eventid,
        v_touchpointid
    FROM
        audienceresponse
    WHERE
        id = p_audienceresponsemetaid;

    SELECT
        journeyid
    INTO v_journeyid
    FROM
        point
    WHERE
        id = v_touchpointid;

    v_utcepoch := get_utc_epoch();
    v_utcdate := get_date_from_utc_epoch(v_utcepoch);
    v_responsedate := get_date_from_utc_epoch(p_responsetime);
    dbms_output.put_line('START : '
                         || v_audienceid
                         || ','
                         || v_eventid
                         || ','
                         || v_touchpointid
                         || ','
                         || v_journeyid);
  -- MAIN LOGIC START

    IF NOT c_journeygoalmaster%isopen THEN
        OPEN c_journeygoalmaster;
    END IF;
    LOOP
        FETCH c_journeygoalmaster INTO r_journeygoalmaster;
        EXIT WHEN c_journeygoalmaster%notfound;
        dbms_output.put_line('GOALTYPE : '
                             || r_journeygoalmaster.goaltype
                             || ','
                             || r_journeygoalmaster.frequency);

        IF r_journeygoalmaster.goaltype = 1 THEN
            BEGIN
        -- FETCH JOURNEY_GOAL_CONTACT DETAILS
                SELECT
                    jgc.*
                INTO r_contact_goal
                FROM
                    journeygoalcontact jgc
                WHERE
                    targettouchpointid = v_touchpointid
                    AND targeteventid = v_eventid
                    AND id = r_journeygoalmaster.id
                    AND ( targetlink = p_link_url
                          OR targetlink = 'Any Link Clicked' );
        -- POPULATE JOURNEYGOALCONTACTTRANSACTION TABLE BASED ON FREQUENCY

                IF r_journeygoalmaster.flagfrequencyenabled = 0 THEN
                    dbms_output.put_line('FREQUENCY IS NULL : ');
                    BEGIN
                        SELECT
                            jgct.*
                        INTO r_jgct
                        FROM
                            journeygoalcontacttransaction jgct
                        WHERE
                            journeygoalcontactid = r_contact_goal.id;

                    EXCEPTION
                        WHEN no_data_found THEN
                            dbms_output.put_line('NO_DATA_FOUND IN JOURNEYGOALCONTACTTRANSACTION');
                            INSERT INTO journeygoalcontacttransaction (
                                journeygoalcontactid,
                                startdate,
                                enddate,
                                percentage,
                                currentaudiencecount,
                                version,
                                createddate,
                                createddateepoch
                            ) VALUES (
                                r_contact_goal.id,
                                NULL,
                                NULL,
                                0.00,
                                0,
                                0,
                                v_utcdate,
                                v_utcepoch
                            );

                            SELECT
                                jgct.*
                            INTO r_jgct
                            FROM
                                journeygoalcontacttransaction jgct
                            WHERE
                                journeygoalcontactid = r_contact_goal.id;

                    END;
          -- CALCULATE COUNT and PERCENTAGE

                    v_count := r_jgct.currentaudiencecount + 1;
                    v_percentage := ( v_count * 100 ) / r_contact_goal.targetaudiencecount;
          -- UPDATE COUNT and PERCENTAGE
                    UPDATE journeygoalcontacttransaction
                    SET
                        currentaudiencecount = v_count,
                        percentage = v_percentage
                    WHERE
                        journeygoalcontactid = r_contact_goal.id;

                ELSE
                    dbms_output.put_line('FREQUENCY IS NOT NULL FOR CONTACT GOAL ID: '
                                         || r_contact_goal.id
                                         || ','
                                         || r_journeygoalmaster.frequency
                                         || ','
                                         || p_responsetime);
          -- SET START_DATE AND END_DATE

                    IF r_journeygoalmaster.frequency = 0 THEN
                        v_start_date := trunc(v_responsedate);
                        v_end_date := trunc(v_responsedate);
                    ELSIF r_journeygoalmaster.frequency = 1 THEN
                        SELECT
                            trunc(v_responsedate, 'DAY') + 1,
                            trunc(v_responsedate, 'DAY') + 7
                        INTO
                            v_start_date,
                            v_end_date
                        FROM
                            dual;

                    ELSIF r_journeygoalmaster.frequency = 2 THEN
                        SELECT
                            trunc(v_responsedate, 'MONTH'),
                            last_day(trunc(v_responsedate, 'MONTH'))
                        INTO
                            v_start_date,
                            v_end_date
                        FROM
                            dual;

                    ELSIF r_journeygoalmaster.frequency = 3 THEN
                        SELECT
                            trunc(v_responsedate, 'Q'),
                            last_day(add_months(trunc(v_responsedate, 'Q'), 2))
                        INTO
                            v_start_date,
                            v_end_date
                        FROM
                            dual;

                    END IF;

                    BEGIN
                        dbms_output.put_line('Frequency range : '
                                             || v_start_date
                                             || ','
                                             || v_end_date
                                             || ','
                                             || r_contact_goal.id);
            -- FETCH JOURNEYGOALCONTACTTRANSACTIONS DETAILS

                        SELECT
                            jgct.*
                        INTO r_jgct
                        FROM
                            journeygoalcontacttransaction jgct
                        WHERE
                            journeygoalcontactid = r_contact_goal.id
                            AND startdate >= v_start_date
                            AND enddate <= v_end_date;

                    EXCEPTION
                        WHEN no_data_found THEN
                            dbms_output.put_line('NO_DATA_FOUND IN JOURNEYGOALCONTACTTRANSACTION' || r_contact_goal.id);
            -- INSERT DEFAULT TRANSACTION ENTRY FOR GIVEN FREQUENCY
                            INSERT INTO journeygoalcontacttransaction (
                                journeygoalcontactid,
                                startdate,
                                enddate,
                                percentage,
                                currentaudiencecount,
                                version,
                                createddate,
                                createddateepoch
                            ) VALUES (
                                r_contact_goal.id,
                                v_start_date,
                                v_end_date,
                                0.00,
                                0,
                                0,
                                v_utcdate,
                                v_utcepoch
                            );

                            SELECT
                                jgct.*
                            INTO r_jgct
                            FROM
                                journeygoalcontacttransaction jgct
                            WHERE
                                journeygoalcontactid = r_contact_goal.id
                                AND startdate >= v_start_date
                                AND enddate <= v_end_date;

                    END;
          -- CALCULATE COUNT and PERCENTAGE

                    v_count := r_jgct.currentaudiencecount + 1;
                    v_percentage := ( v_count * 100 ) / r_contact_goal.targetaudiencecount;
          -- UPDATE COUNT and PERCENTAGE
                    UPDATE journeygoalcontacttransaction
                    SET
                        currentaudiencecount = v_count,
                        percentage = v_percentage
                    WHERE
                        journeygoalcontactid = r_contact_goal.id
                        AND startdate >= v_start_date
                        AND enddate <= v_end_date;

                END IF;
        -- POPULATE JOURNEYAUDIENCEGOAL TABLE

                INSERT INTO journeyaudiencegoal (
                    audienceid,
                    goalid,
                    goalstatus,
                    createddate,
                    createddateepoch,
                    responsetime,
                    responsetimeepoch,
                    version
                ) VALUES (
                    v_audienceid,
                    r_journeygoalmaster.id,
                    'GOAL_INCOMPLETE',
                    v_utcdate,
                    v_utcepoch,
                    v_responsedate,
                    p_responsetime,
                    0
                );

            EXCEPTION
                WHEN no_data_found THEN
                    dbms_output.put_line('NO_DATA_FOUND IN JOURNEYGOALCONTACT');
                    v_error_msg := 'NO_DATA_FOUND IN JOURNEYGOALCONTACT :: '
                                   || v_audienceid
                                   || ','
                                   || v_eventid
                                   || ','
                                   || v_touchpointid
                                   || ','
                                   || sqlerrm;

                    INSERT INTO journeydataerrors (
                        entrysourceid,
                        journeyid,
                        sourcetopic,
                        errormsg,
                        createddate,
                        createddateepoch,
                        version
                    ) VALUES (
                        v_audienceid,
                        v_journeyid,
                        'PROCESS_JOURNEY_GOALS_META',
                        v_error_msg,
                        v_utcdate,
                        v_utcepoch,
                        0
                    );

            END;
        END IF;

    END LOOP;

    CLOSE c_journeygoalmaster;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR IN PROCESS_JOURNEY_GOALS_META :: ' || sqlerrm);
        v_error_msg := 'ERROR IN PROCESS_JOURNEY_GOALS_META :: '
                       || p_audienceresponsemetaid
                       || ','
                       || sqlerrm;
        INSERT INTO journeydataerrors (
            entrysourceid,
            journeyid,
            sourcetopic,
            errormsg,
            createddate,
            createddateepoch,
            version
        ) VALUES (
            v_audienceid,
            v_journeyid,
            'PROCESS_JOURNEY_GOALS_META',
            v_error_msg,
            v_utcdate,
            v_utcepoch,
            0
        );

END process_journey_goals_meta;
/

-- *****************************************************************
-- This procedure is used to process the historical responses when goal new goal added to journey.
-- @Param p_goalId IN 
-- *****************************************************************
create or replace  PROCEDURE process_journey_goals_hist (
    p_goalid IN NUMBER
) IS

    r_contact_goal                    journeygoalcontact%rowtype;
    r_journeygoalcontacttransaction   journeygoalcontacttransaction%rowtype;
    r_sales_goal                      journeygoalsales%rowtype;
    r_journeygoalsalestransaction     journeygoalsalestransaction%rowtype;
    r_audienceresponse                audienceresponse%rowtype;
    v_count                           NUMBER(20);
    v_journeyid                       NUMBER(20);
    v_percentage                      NUMBER(6, 2);
    v_start_date                      TIMESTAMP;
    v_end_date                        TIMESTAMP;
    v_error_msg                       VARCHAR(500);
    v_targeturl                       VARCHAR(500);
    v_eventname                       VARCHAR(250);
    v_responsetimemeta                NUMBER;
    v_linkurl                         VARCHAR(500);
    v_utcdate                         TIMESTAMP;
    v_utcepoch                        NUMBER;
    v_responsedatemeta                TIMESTAMP;
    CURSOR c_journeygoalmaster IS
    SELECT
        jgm.*
    FROM
        journeygoalmaster jgm
    WHERE
        jgm.id = p_goalid;

    r_journeygoalmaster               c_journeygoalmaster%rowtype;
    CURSOR c_audienceresponse (
        v_touchpointid   NUMBER,
        v_eventid        NUMBER
    ) IS
    SELECT
        ar.*
    FROM
        audienceresponse ar
    WHERE
        ar.touchpointid = v_touchpointid
        AND eventid = v_eventid;

    CURSOR c_audienceresponsemeta (
        p_audienceresponseid NUMBER
    ) IS
    SELECT
        linkurl,
        responsetimeepoch
    FROM
        audienceresponsemetadata arm
    WHERE
        arm.audienceresponseid = p_audienceresponseid;

BEGIN
    dbms_output.put_line('START : ' || p_goalid);
    SELECT
        journeyid
    INTO v_journeyid
    FROM
        journeygoalmaster
    WHERE
        id = p_goalid;
        
    v_utcepoch := get_utc_epoch();
    v_utcdate := get_date_from_utc_epoch(v_utcepoch);

    IF NOT c_journeygoalmaster%isopen THEN
        OPEN c_journeygoalmaster;
    END IF;
    LOOP
        FETCH c_journeygoalmaster INTO r_journeygoalmaster;
        EXIT WHEN c_journeygoalmaster%notfound;
        dbms_output.put_line('GOALTYPE : '
                             || r_journeygoalmaster.goaltype
                             || ','
                             || r_journeygoalmaster.frequency);

        IF r_journeygoalmaster.goaltype = 1 THEN
            SELECT
                jgc.*
            INTO r_contact_goal
            FROM
                journeygoalcontact jgc
            WHERE
                id = r_journeygoalmaster.id;

            SELECT
                displayname
            INTO v_eventname
            FROM
                audienceresponseeventmaster
            WHERE
                id = r_contact_goal.targeteventid;

            BEGIN
                IF r_journeygoalmaster.flagfrequencyenabled = 0 THEN
                    dbms_output.put_line('FREQUENCY IS NULL : ' || r_contact_goal.id);
                    IF NOT c_audienceresponse%isopen THEN
                        OPEN c_audienceresponse(r_contact_goal.targettouchpointid, r_contact_goal.targeteventid);
                    END IF;

                    LOOP
                        FETCH c_audienceresponse INTO r_audienceresponse;
                        v_responsedatemeta := get_date_from_utc_epoch(r_audienceresponse.responsetimeepoch);
                        EXIT WHEN c_audienceresponse%notfound;
                        IF v_eventname NOT IN (
                            'LINK_CLICK_EMAIL',
                            'LINK_CLICK_SMS'
                        ) THEN
                            BEGIN
                                SELECT
                                    jgct.*
                                INTO r_journeygoalcontacttransaction
                                FROM
                                    journeygoalcontacttransaction jgct
                                WHERE
                                    journeygoalcontactid = r_contact_goal.id;

                            EXCEPTION
                                WHEN no_data_found THEN
                                    dbms_output.put_line('NO_DATA_FOUND IN JOURNEYGOALCONTACTTRANSACTION');
                                    INSERT INTO journeygoalcontacttransaction (
                                        journeygoalcontactid,
                                        startdate,
                                        enddate,
                                        percentage,
                                        currentaudiencecount,
                                        version,
                                        createddate,
                                        createddateepoch
                                    ) VALUES (
                                        r_contact_goal.id,
                                        NULL,
                                        NULL,
                                        0.00,
                                        0,
                                        0,
                                        v_utcdate,
                                        v_utcepoch
                                    );

                                    SELECT
                                        jgct.*
                                    INTO r_journeygoalcontacttransaction
                                    FROM
                                        journeygoalcontacttransaction jgct
                                    WHERE
                                        journeygoalcontactid = r_contact_goal.id;

                            END;
              -- CALCULATE COUNT and PERCENTAGE

                            v_count := r_journeygoalcontacttransaction.currentaudiencecount + 1;
                            v_percentage := ( v_count * 100 ) / r_contact_goal.targetaudiencecount;
              -- UPDATE COUNT and PERCENTAGE
                            UPDATE journeygoalcontacttransaction
                            SET
                                currentaudiencecount = v_count,
                                percentage = v_percentage
                            WHERE
                                journeygoalcontactid = r_contact_goal.id;
              -- POPULATE JOURNEYAUDIENCEGOAL TABLE

                            INSERT INTO journeyaudiencegoal (
                                audienceid,
                                goalid,
                                goalstatus,
                                createddate,
                                createddateepoch,
                                responsetime,
                                responsetimeepoch,
                                version
                            ) VALUES (
                                r_audienceresponse.audienceid,
                                r_journeygoalmaster.id,
                                'GOAL_INCOMPLETE',
                                v_utcdate,
                                v_utcepoch,
                                v_responsedatemeta,
                                r_audienceresponse.responsetimeepoch,
                                0
                            );

                        ELSE
                            dbms_output.put_line('GOAL ID : '
                                                 || r_contact_goal.id
                                                 || ','
                                                 || v_eventname);
                            IF NOT c_audienceresponsemeta%isopen THEN
                                OPEN c_audienceresponsemeta(r_audienceresponse.id);
                            END IF;
                            LOOP
                                FETCH c_audienceresponsemeta INTO
                                    v_linkurl,
                                    v_responsetimemeta;
                                EXIT WHEN c_audienceresponsemeta%notfound;
                                IF v_linkurl IS NOT NULL AND v_responsetimemeta IS NOT NULL AND ( r_contact_goal.targetlink = v_linkurl
                                OR r_contact_goal.targetlink = 'Any Link Clicked' ) THEN
                                    dbms_output.put_line('Execute process_journey_goals_meta for v_audienceresponseid' || r_audienceresponse
                                    .id);
                                    BEGIN
                                        SELECT
                                            jgct.*
                                        INTO r_journeygoalcontacttransaction
                                        FROM
                                            journeygoalcontacttransaction jgct
                                        WHERE
                                            journeygoalcontactid = r_contact_goal.id;

                                    EXCEPTION
                                        WHEN no_data_found THEN
                                            dbms_output.put_line('NO_DATA_FOUND IN JOURNEYGOALCONTACTTRANSACTION');
                                            INSERT INTO journeygoalcontacttransaction (
                                                journeygoalcontactid,
                                                startdate,
                                                enddate,
                                                percentage,
                                                currentaudiencecount,
                                                version,
                                                createddate,
                                                createddateepoch
                                            ) VALUES (
                                                r_contact_goal.id,
                                                NULL,
                                                NULL,
                                                0.00,
                                                0,
                                                0,
                                                v_utcdate,
                                                v_utcepoch
                                            );

                                            SELECT
                                                jgct.*
                                            INTO r_journeygoalcontacttransaction
                                            FROM
                                                journeygoalcontacttransaction jgct
                                            WHERE
                                                journeygoalcontactid = r_contact_goal.id;

                                    END;
                  -- CALCULATE COUNT and PERCENTAGE

                                    v_count := r_journeygoalcontacttransaction.currentaudiencecount + 1;
                                    v_percentage := ( v_count * 100 ) / r_contact_goal.targetaudiencecount;
                  -- UPDATE COUNT and PERCENTAGE
                                    UPDATE journeygoalcontacttransaction
                                    SET
                                        currentaudiencecount = v_count,
                                        percentage = v_percentage
                                    WHERE
                                        journeygoalcontactid = r_contact_goal.id;
                  -- POPULATE JOURNEYAUDIENCEGOAL TABLE

                                    INSERT INTO journeyaudiencegoal (
                                        audienceid,
                                        goalid,
                                        goalstatus,
                                        createddate,
                                        createddateepoch,
                                        responsetime,
                                        responsetimeepoch,
                                        version
                                    ) VALUES (
                                        r_audienceresponse.audienceid,
                                        r_journeygoalmaster.id,
                                        'GOAL_INCOMPLETE',
                                        v_utcdate,
                                        v_utcepoch,
                                        get_date_from_utc_epoch(v_responsetimemeta),
                                        v_responsetimemeta,
                                        0
                                    );

                                END IF;

                            END LOOP;

                            CLOSE c_audienceresponsemeta;
                        END IF;

                    END LOOP;

                    CLOSE c_audienceresponse;
                END IF;
            EXCEPTION
                WHEN OTHERS THEN
                    dbms_output.put_line('NO_DATA_FOUND IN JOURNEYGOALCONTACT');
                    v_error_msg := 'NO_DATA_FOUND IN JOURNEYGOALCONTACT :: '
                                   || p_goalid
                                   || ','
                                   || sqlerrm;
                    INSERT INTO journeydataerrors (
                        entrysourceid,
                        journeyid,
                        sourcetopic,
                        errormsg,
                        createddate,
                        createddateepoch,
                        version
                    ) VALUES (
                        r_audienceresponse.audienceid,
                        v_journeyid,
                        'PROCESS_JOURNEY_GOALS_HIST',
                        v_error_msg,
                        v_utcdate,
                        v_utcepoch,
                        0
                    );

            END;

        ELSIF r_journeygoalmaster.goaltype = 2 THEN
            BEGIN
        -- FETCH JOURNEY_GOAL_SALES DETAILS
                SELECT
                    jgs.*
                INTO r_sales_goal
                FROM
                    journeygoalsales jgs
                WHERE
                    id = r_journeygoalmaster.id;
        -- POPULATE journeygoalsalestransactions TABLE BASED ON FREQUENCY

                IF r_journeygoalmaster.flagfrequencyenabled = 0 THEN
                    dbms_output.put_line('FREQUENCY IS NULL : ' || r_sales_goal.id);
                    IF NOT c_audienceresponse%isopen THEN
                        OPEN c_audienceresponse(r_contact_goal.targettouchpointid, r_contact_goal.targeteventid);
                    END IF;

                    LOOP
                        FETCH c_audienceresponse INTO r_audienceresponse;
                        EXIT WHEN c_audienceresponse%notfound;
                        BEGIN
                            SELECT
                                jgct.*
                            INTO r_journeygoalsalestransaction
                            FROM
                                journeygoalsalestransaction jgct
                            WHERE
                                journeygoalsalesid = r_sales_goal.id;

                        EXCEPTION
                            WHEN no_data_found THEN
                                dbms_output.put_line('NO_DATA_FOUND IN journeygoalsalestransaction');
                                INSERT INTO journeygoalsalestransaction (
                                    journeygoalsalesid,
                                    startdate,
                                    enddate,
                                    percentage,
                                    currentaudiencecount,
                                    version,
                                    createddate,
                                    createddateepoch
                                ) VALUES (
                                    r_sales_goal.id,
                                    NULL,
                                    NULL,
                                    0.00,
                                    0,
                                    0,
                                    v_utcdate,
                                    v_utcepoch
                                );

                                SELECT
                                    jgct.*
                                INTO r_journeygoalsalestransaction
                                FROM
                                    journeygoalsalestransaction jgct
                                WHERE
                                    journeygoalsalesid = r_sales_goal.id;

                        END;
            -- CALCULATE COUNT and PERCENTAGE

                        v_count := r_journeygoalsalestransaction.currentaudiencecount + 1;
                        v_percentage := ( v_count * 100 ) / r_sales_goal.targetaudiencecount;
            -- UPDATE COUNT and PERCENTAGE
                        UPDATE journeygoalsalestransaction
                        SET
                            currentaudiencecount = v_count,
                            percentage = v_percentage
                        WHERE
                            journeygoalsalesid = r_sales_goal.id;
            -- POPULATE JOURNEYAUDIENCEGOAL TABLE

                        INSERT INTO journeyaudiencegoal (
                            audienceid,
                            goalid,
                            goalstatus,
                            createddate,
                            createddateepoch,
                            responsetime,
                            responsetimeepoch,
                            version
                        ) VALUES (
                            r_audienceresponse.audienceid,
                            r_journeygoalmaster.id,
                            'GOAL_INCOMPLETE',
                            v_utcdate,
                            v_utcepoch,
                            get_date_from_utc_epoch(r_audienceresponse.responsetimeepoch),
                            r_audienceresponse.responsetimeepoch,
                            0
                        );

                    END LOOP;

                    CLOSE c_audienceresponse;
                END IF;

            EXCEPTION
                WHEN no_data_found THEN
                    dbms_output.put_line('NO_DATA_FOUND IN JOURNEYGOALSALES');
                    v_error_msg := 'NO_DATA_FOUND IN JOURNEYGOALSALES :: '
                                   || p_goalid
                                   || ','
                                   || sqlerrm;
                    INSERT INTO journeydataerrors (
                        entrysourceid,
                        journeyid,
                        sourcetopic,
                        errormsg,
                        createddate,
                        createddateepoch,
                        version
                    ) VALUES (
                        r_audienceresponse.audienceid,
                        v_journeyid,
                        'PROCESS_JOURNEY_GOALS_HIST',
                        v_error_msg,
                        v_utcdate,
                        v_utcepoch,
                        0
                    );

            END;
        END IF;

    END LOOP;

    CLOSE c_journeygoalmaster;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR IN PROCESS_JOURNEY_GOALS_HIST :: '
                             || p_goalid
                             || ','
                             || sqlerrm);
        v_error_msg := 'ERROR IN PROCESS_JOURNEY_GOALS_HIST :: '
                       || p_goalid
                       || ','
                       || sqlerrm;
        INSERT INTO journeydataerrors (
            entrysourceid,
            journeyid,
            sourcetopic,
            errormsg,
            createddate,
            createddateepoch,
            version
        ) VALUES (
            0,
            v_journeyid,
            'PROCESS_JOURNEY_GOALS_HIST',
            v_error_msg,
            v_utcdate,
            v_utcepoch,
            0
        );

END process_journey_goals_hist;
/


-- *****************************************************************
-- This is After Insert Trigger on AudienceResponse,to process the 
-- journey goal using procedure.
-- *****************************************************************
create or replace  TRIGGER ar_after_insert AFTER
    INSERT ON audienceresponse
    FOR EACH ROW
DECLARE
    v_touchpointid   NUMBER(20);
    v_eventid        NUMBER(20);
    v_audienceid     NUMBER(20);
    v_responsetime   NUMBER;
BEGIN
    v_audienceid := :new.audienceid;
    v_eventid := :new.eventid;
    v_touchpointid := :new.touchpointid;
    v_responsetime := :new.responsetimeepoch;
    process_journey_goals(v_audienceid, v_eventid, v_touchpointid, v_responsetime);
END;
/

-- *****************************************************************
-- This is After Insert Trigger on AudienceResponse,to process the 
-- journey goal for sms/email click event using procedure.
-- *****************************************************************
create or replace  TRIGGER armd_after_insert AFTER
    INSERT ON audienceresponsemetadata
    FOR EACH ROW
DECLARE
    v_audienceresponseid   NUMBER(20);
    v_link_url             VARCHAR2(500);
    v_responsetime         NUMBER;
BEGIN
    v_audienceresponseid := :new.audienceresponseid;
    v_link_url := :new.linkurl;
    v_responsetime := :new.responsetimeepoch;
    IF v_link_url IS NOT NULL THEN
        process_journey_goals_meta(v_audienceresponseid, v_link_url, v_responsetime);
    END IF;
END;
/

-- *****************************************************************
-- This procedure call on every after insert in AudienceResponse for,
-- EMAIL touchpoint, based on Event (OPEN,SENT,DELIVERED,
-- SOFT/HARD BOUNCE) it popuate Report schema tables.
-- @Params - AUDIENCERESPONSEID IN, TOUCHPOINTID IN, AUDIENCEID IN,
-- EVENTID IN, RESPONSETIME IN
-- *****************************************************************
create or replace  PROCEDURE email_perf (
    p_audienceresponseid   IN   NUMBER,
    p_pointid              IN   NUMBER,
    p_audienceid           IN   NUMBER,
    p_eventid              IN   NUMBER,
    p_responsetime         IN   NUMBER
) IS

    v_journeyid              NUMBER(20);
    v_pointname              VARCHAR2(250);
    v_audienceemail          VARCHAR2(100);
    v_template               VARCHAR2(100);
    v_channel                VARCHAR2(50);
    v_connectorinfo          VARCHAR2(200);
    v_sentresponsetime       NUMBER;
    v_aveareinteartiontime   NUMBER(20) := 0;
    v_channelagent           NUMBER(20);
    v_error_msg              VARCHAR2(500 CHAR);
    v_utcdate                TIMESTAMP;
    v_utcepoch               NUMBER;
    v_responsedate           TIMESTAMP;
    v_sentresponsedate       TIMESTAMP;
BEGIN
    SELECT
        p.journeyid,
        p.name
    INTO
        v_journeyid,
        v_pointname
    FROM
        point p
    WHERE
        p.id = p_pointid;

    v_utcepoch := get_utc_epoch();
    v_utcdate := get_date_from_utc_epoch(v_utcepoch);
    SELECT
        ja.email
    INTO v_audienceemail
    FROM
        journeyaudiences ja
    WHERE
        ja.id = p_audienceid;

    SELECT
        ep.channelagent,
        ep.connectorinfo
    INTO
        v_channelagent,
        v_connectorinfo
    FROM
        emailtouchpoint ep
    WHERE
        ep.id = p_pointid;

    IF v_channelagent = 1 THEN
        BEGIN
            v_channel := 'Deliver';
            SELECT
                dem.documentname
            INTO v_template
            FROM
                delivermetadata dem
            WHERE
                dem.touchpointid = p_pointid;

        EXCEPTION
            WHEN no_data_found THEN
                dbms_output.put_line('DOCUMENTID NOT FOUND IN DELIVERMETADATA FOR TOUCHPOINTID' || p_pointid);
                v_template := NULL;
        END;
    ELSIF v_channelagent = 0 THEN
        BEGIN
            SELECT
                lmd.documentname
            INTO v_template
            FROM
                linkmetadata lmd
            WHERE
                lmd.touchpointid = p_pointid;

        EXCEPTION
            WHEN no_data_found THEN
                dbms_output.put_line('DOCUMENTNAME NOT FOUND IN LINKMETADATA FOR TOUCHPOINTID' || p_pointid);
                v_template := NULL;
        END;

        BEGIN
            IF v_connectorinfo IS NULL THEN
                SELECT
                    dc.connectionname
                INTO v_connectorinfo
                FROM
                    defaultconnection dc
                WHERE
                    upper(dc.connectiontype) = 'EMAIL';

            END IF;

        EXCEPTION
            WHEN no_data_found THEN
                dbms_output.put_line('CONNECTIONNAME NOT FOUND IN DEFAULTCONNECTION');
                v_connectorinfo := '';
        END;

        v_channel := 'Link - ' || v_connectorinfo;
    END IF;

    CASE ( p_eventid )
        WHEN 1 THEN
            BEGIN
                SELECT
                    eps.senttimestampepoch
                INTO v_sentresponsetime
                FROM
                    emailperformancesent eps
                WHERE
                    eps.audienceid = p_audienceid
                    AND eps.pointid = p_pointid;

                v_responsedate := get_date_from_utc_epoch(p_responsetime);
                v_sentresponsedate := get_date_from_utc_epoch(v_sentresponsetime);
                SELECT
                    ( EXTRACT(DAY FROM diff) ) * 24 * 60 + ( EXTRACT(HOUR FROM diff) ) * 60 + ( EXTRACT(MINUTE FROM diff) ) total_mins
                INTO v_aveareinteartiontime
                FROM
                    (
                        SELECT
                            v_responsedate - v_sentresponsedate diff
                        FROM
                            dual
                    );

                IF v_aveareinteartiontime < 0 THEN
                    v_aveareinteartiontime := 0;
                END IF;
            EXCEPTION
                WHEN no_data_found THEN
                    dbms_output.put_line('NO SENT RESPONSETIME FOUND FOR AUDIENCEID '
                                         || p_audienceid
                                         || 'AND POINTID '
                                         || p_pointid);
                    v_aveareinteartiontime := 0;
                    v_error_msg := 'NO SENT RESPONSETIME FOUND FOR AUDIENCEID :: '
                                   || p_audienceid
                                   || ','
                                   || p_eventid
                                   || ','
                                   || p_pointid
                                   || ','
                                   || sqlerrm;

                    INSERT INTO journeydataerrors (
                        entrysourceid,
                        journeyid,
                        sourcetopic,
                        errormsg,
                        createddate,
                        createddateepoch,
                        version
                    ) VALUES (
                        p_audienceid,
                        v_journeyid,
                        'EMAIL_PERF',
                        v_error_msg,
                        v_utcdate,
                        v_utcepoch,
                        0
                    );

                WHEN OTHERS THEN
                    dbms_output.put_line('ERROR DURING CALCULATING AVERAGEOPENINTERACTIONTIME '
                                         || p_audienceid
                                         || 'AND POINTID '
                                         || p_pointid);
                    v_aveareinteartiontime := 0;
                    v_error_msg := 'ERROR DURING CALCULATING AVERAGEOPENINTERACTIONTIME :: '
                                   || p_audienceid
                                   || ','
                                   || p_eventid
                                   || ','
                                   || p_pointid
                                   || ','
                                   || sqlerrm;

                    INSERT INTO journeydataerrors (
                        entrysourceid,
                        journeyid,
                        sourcetopic,
                        errormsg,
                        createddate,
                        createddateepoch,
                        version
                    ) VALUES (
                        p_audienceid,
                        v_journeyid,
                        'EMAIL_PERF',
                        v_error_msg,
                        v_utcdate,
                        v_utcepoch,
                        0
                    );

            END;

            INSERT INTO emailperformanceopen (
                journeyid,
                pointid,
                pointname,
                audienceid,
                audienceemail,
                template,
                channel,
                opentimestamp,
                opentimestampepoch,
                averageopeninteractiontime
            ) VALUES (
                v_journeyid,
                p_pointid,
                v_pointname,
                p_audienceid,
                v_audienceemail,
                v_template,
                v_channel,
                get_date_from_utc_epoch(p_responsetime),
                p_responsetime,
                v_aveareinteartiontime
            );

        WHEN 3 THEN
            BEGIN
                DELETE FROM emailperformancedelivery epd
                WHERE
                    epd.audienceid = p_audienceid
                    AND epd.pointid = p_pointid;

            EXCEPTION
                WHEN no_data_found THEN
                    dbms_output.put_line('NO DATA FOUND IN EMAILPERFORMANCEDELIVERY FOR AUDIENCEID '
                                         || p_audienceid
                                         || 'AND POINTID'
                                         || p_pointid);
                WHEN OTHERS THEN
                    dbms_output.put_line('ERROR DURING DELETING FROM EMAILPERFORMANCEDELIVERY FOR SOFT BOUNCE :: '
                                         || 'AUDIENCERESPONSE'
                                         || p_audienceresponseid
                                         || ','
                                         || p_audienceid
                                         || 'AND POINTID '
                                         || p_pointid);
            END;
        WHEN 4 THEN
            BEGIN
                DELETE FROM emailperformancedelivery epd
                WHERE
                    epd.audienceid = p_audienceid
                    AND epd.pointid = p_pointid;

            EXCEPTION
                WHEN no_data_found THEN
                    dbms_output.put_line('NO DATA FOUND IN EMAILPERFORMANCEDELIVERY FOR AUDIENCEID'
                                         || p_audienceid
                                         || 'AND POINTID'
                                         || p_pointid);
                WHEN OTHERS THEN
                    dbms_output.put_line('ERROR DURING DELETING FROM EMAILPERFORMANCEDELIVERY FOR HARD BOUNCE :: '
                                         || 'AUDIENCERESPONSE'
                                         || p_audienceresponseid
                                         || ','
                                         || p_audienceid
                                         || 'AND POINTID '
                                         || p_pointid);
            END;
        WHEN 5 THEN
            INSERT INTO emailperformancesent (
                journeyid,
                pointid,
                pointname,
                audienceid,
                audienceemail,
                template,
                channel,
                senttimestamp,
                senttimestampepoch
            ) VALUES (
                v_journeyid,
                p_pointid,
                v_pointname,
                p_audienceid,
                v_audienceemail,
                v_template,
                v_channel,
                get_date_from_utc_epoch(p_responsetime),
                p_responsetime
            );

            INSERT INTO emailperformancedelivery (
                journeyid,
                pointid,
                pointname,
                audienceid,
                audienceemail,
                template,
                channel,
                deliverytimestamp,
                deliverytimestampepoch
            ) VALUES (
                v_journeyid,
                p_pointid,
                v_pointname,
                p_audienceid,
                v_audienceemail,
                v_template,
                v_channel,
                get_date_from_utc_epoch(p_responsetime),
                p_responsetime
            );

        ELSE
            dbms_output.put_line('INVALID EVENT ID' || p_eventid);
    END CASE;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR IN EMAIL_PERF ----' || sqlerrm);
        v_error_msg := 'ERROR IN EMAIL_PERF :: '
                       || 'AUDIENCERESPONSE'
                       || p_audienceresponseid
                       || ','
                       || p_audienceid
                       || ','
                       || p_eventid
                       || ','
                       || p_pointid
                       || ','
                       || sqlerrm;

        INSERT INTO journeydataerrors (
            entrysourceid,
            journeyid,
            sourcetopic,
            errormsg,
            createddate,
            createddateepoch,
            version
        ) VALUES (
            p_audienceid,
            v_journeyid,
            'EMAIL_PERF',
            v_error_msg,
            v_utcdate,
            v_utcepoch,
            0
        );

END email_perf;
/

-- *****************************************************************
-- This procedure call on every after insert in AudienceResponse for,
-- SMS touchpoint, based on Event (SENT,DELIVERED,CLICK) it popuate
-- Report tables.
-- @Params - AUDIENCERESPONSEID IN, TOUCHPOINTID IN, AUDIENCEID IN,
-- EVENTID IN, RESPONSETIME IN
-- *****************************************************************
create or replace  PROCEDURE sms_perf (
    p_audienceresponseid   IN   NUMBER,
    p_pointid              IN   NUMBER,
    p_audienceid           IN   NUMBER,
    p_eventid              IN   NUMBER,
    p_responsetime         IN   NUMBER
) IS

    v_journeyid              NUMBER(20);
    v_pointname              VARCHAR2(250);
    v_audiencemobile         VARCHAR(100);
    v_linkid                 NUMBER(20);
    v_linkurl                VARCHAR2(250);
    v_template               VARCHAR2(100);
    v_channel                VARCHAR2(50);
    v_connectorinfo          VARCHAR2(200);
    v_sentresponsetime       NUMBER;
    v_aveareinteartiontime   NUMBER(20) := 0;
    v_channelagent           NUMBER(20);
    v_error_msg              VARCHAR2(500);
    v_utcdate                TIMESTAMP;
    v_utcepoch               NUMBER;
    v_responsedate           TIMESTAMP;
    v_sentresponsedate       TIMESTAMP;
BEGIN
    SELECT
        p.journeyid,
        p.name
    INTO
        v_journeyid,
        v_pointname
    FROM
        point p
    WHERE
        p.id = p_pointid;

    v_utcepoch := get_utc_epoch();
    v_utcdate := get_date_from_utc_epoch(v_utcepoch);
    SELECT
        ja.mobilenumber
    INTO v_audiencemobile
    FROM
        journeyaudiences ja
    WHERE
        ja.id = p_audienceid;

    SELECT
        sp.connectorinfo,
        sp.channelagent
    INTO
        v_connectorinfo,
        v_channelagent
    FROM
        smstouchpoint sp
    WHERE
        sp.id = p_pointid;

    IF v_channelagent = 1 THEN
        BEGIN
            v_channel := 'Deliver';
            SELECT
                dem.documentname
            INTO v_template
            FROM
                delivermetadata dem
            WHERE
                dem.touchpointid = p_pointid;

        EXCEPTION
            WHEN no_data_found THEN
                dbms_output.put_line('DOCUMENTID NOT FOUND IN DELIVERMETADATA FOR TOUCHPOINTID' || p_pointid);
                v_template := NULL;
        END;
    ELSIF v_channelagent = 0 THEN
        BEGIN
            SELECT
                lmd.documentname
            INTO v_template
            FROM
                linkmetadata lmd
            WHERE
                lmd.touchpointid = p_pointid;

        EXCEPTION
            WHEN no_data_found THEN
                dbms_output.put_line('DOCUMENTNAME NOT FOUND IN LINKMETADATA FOR TOUCHPOINTID' || p_pointid);
                v_template := NULL;
        END;

        BEGIN
            IF v_connectorinfo IS NULL THEN
                SELECT
                    dc.connectionname
                INTO v_connectorinfo
                FROM
                    defaultconnection dc
                WHERE
                    upper(dc.connectiontype) = 'SMS';

            END IF;

        EXCEPTION
            WHEN no_data_found THEN
                dbms_output.put_line('CONNECTIONNAME NOT FOUND IN DEFAULTCONNECTION');
                v_connectorinfo := '';
        END;

        v_channel := 'Link - ' || v_connectorinfo;
    END IF;

    CASE ( p_eventid )
        WHEN 7 THEN
            BEGIN
                SELECT
                    arm.linkurl,
                    arm.linkid
                INTO
                    v_linkurl,
                    v_linkid
                FROM
                    audienceresponsemetadata arm
                WHERE
                    arm.audienceresponseid = p_audienceresponseid;

            EXCEPTION
                WHEN no_data_found THEN
                    dbms_output.put_line('NO LINK DATA FOUND FOR AUDIENCEID '
                                         || p_audienceid
                                         || 'AND POINTID '
                                         || p_pointid);
                    v_linkurl := NULL;
                    v_linkid := NULL;
            END;

            BEGIN
                SELECT
                    ar.senttimestampepoch
                INTO v_sentresponsetime
                FROM
                    smsperformancesent ar
                WHERE
                    ar.audienceid = p_audienceid
                    AND ar.pointid = p_pointid;

                v_responsedate := get_date_from_utc_epoch(p_responsetime);
                v_sentresponsedate := get_date_from_utc_epoch(v_sentresponsetime);
                SELECT
                    ( EXTRACT(DAY FROM diff) ) * 24 * 60 + ( EXTRACT(HOUR FROM diff) ) * 60 + ( EXTRACT(MINUTE FROM diff) ) total_mins
                INTO v_aveareinteartiontime
                FROM
                    (
                        SELECT
                            v_responsedate - v_sentresponsedate diff
                        FROM
                            dual
                    );

                IF v_aveareinteartiontime < 0 THEN
                    v_aveareinteartiontime := 0;
                END IF;
            EXCEPTION
                WHEN no_data_found THEN
                    dbms_output.put_line('NO SENT RESPONSETIME FOUND FOR AUDIENCEID '
                                         || p_audienceid
                                         || 'AND POINTID '
                                         || p_pointid);
                    v_aveareinteartiontime := 0;
                WHEN OTHERS THEN
                    dbms_output.put_line('ERROR DURING CALCULATING AVERAGEOPENINTERACTIONTIME '
                                         || p_audienceid
                                         || 'AND POINTID '
                                         || p_pointid);
                    v_aveareinteartiontime := 0;
                    v_error_msg := 'ERROR DURING CALCULATING AVERAGEOPENINTERACTIONTIME :: '
                                   || p_audienceid
                                   || ','
                                   || p_eventid
                                   || ','
                                   || p_pointid
                                   || ','
                                   || sqlerrm;

                    INSERT INTO journeydataerrors (
                        entrysourceid,
                        journeyid,
                        sourcetopic,
                        errormsg,
                        createddate,
                        createddateepoch,
                        version
                    ) VALUES (
                        p_audienceid,
                        v_journeyid,
                        'SMS_PERF',
                        v_error_msg,
                        v_utcdate,
                        v_utcepoch,
                        0
                    );

            END;

            INSERT INTO smsperformancelinkclick (
                journeyid,
                pointid,
                pointname,
                audienceid,
                audiencemobilenumber,
                template,
                channel,
                linkid,
                linkurl,
                clicktimestamp,
                clicktimestampepoch,
                averageclickinteractiontime
            ) VALUES (
                v_journeyid,
                p_pointid,
                v_pointname,
                p_audienceid,
                v_audiencemobile,
                v_template,
                v_channel,
                v_linkid,
                v_linkurl,
                v_responsedate,
                p_responsetime,
                v_aveareinteartiontime
            );

        WHEN 8 THEN
            INSERT INTO smsperformancedelivery (
                journeyid,
                pointid,
                pointname,
                audienceid,
                audiencemobilenumber,
                template,
                channel,
                deliverytimestamp,
                deliverytimestampepoch
            ) VALUES (
                v_journeyid,
                p_pointid,
                v_pointname,
                p_audienceid,
                v_audiencemobile,
                v_template,
                v_channel,
                v_responsedate,
                p_responsetime
            );

        WHEN 9 THEN
            INSERT INTO smsperformancesent (
                journeyid,
                pointid,
                pointname,
                audienceid,
                audiencemobilenumber,
                template,
                channel,
                senttimestamp,
                senttimestampepoch
            ) VALUES (
                v_journeyid,
                p_pointid,
                v_pointname,
                p_audienceid,
                v_audiencemobile,
                v_template,
                v_channel,
                v_responsedate,
                p_responsetime
            );

        ELSE
            dbms_output.put_line('INVALID EVENT ID' || p_eventid);
    END CASE;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR IN SMS_PERF ----' || sqlerrm);
        v_error_msg := 'ERROR IN SMS_PERF :: '
                       || 'AUDIENCERESPONSE'
                       || p_audienceresponseid
                       || ','
                       || p_audienceid
                       || ','
                       || p_eventid
                       || ','
                       || p_pointid
                       || ','
                       || sqlerrm;

        INSERT INTO journeydataerrors (
            entrysourceid,
            journeyid,
            sourcetopic,
            errormsg,
            createddate,
            createddateepoch,
            version
        ) VALUES (
            p_audienceid,
            v_journeyid,
            'SMS_PERF',
            v_error_msg,
            v_utcdate,
            v_utcepoch,
            0
        );

END sms_perf;
/

-- *****************************************************************
-- This procedure call on every after insert in AudienceResponseMetaData for,
-- EMAIL touchpoint, based on Event (CLICK), it popuate Report schema tables.
-- @Params - AUDIENCERESPONSEID IN, AUDIENCERESPONSEMETADATAID IN, AUDIENCEID IN,
-- RESPONSETIME IN,LINKID IN,LINKURL IN
-- *****************************************************************
create or replace  PROCEDURE email_link_perf (
    p_audienceresponseid           IN   NUMBER,
    p_audienceresponsemetadataid   IN   NUMBER,
    p_responsetime                 IN   NUMBER,
    p_linkid                       IN   NUMBER,
    p_linkurl                      IN   VARCHAR
) IS

    v_journeyid              NUMBER(20);
    v_pointname              VARCHAR2(250);
    v_audienceemail          VARCHAR2(100);
    v_template               VARCHAR2(100);
    v_channel                VARCHAR2(50);
    v_connectorinfo          VARCHAR2(200);
    v_sentresponsetime       NUMBER;
    v_aveareinteartiontime   NUMBER(20) := 0;
    v_channelagent           NUMBER(20);
    v_error_msg              VARCHAR2(500);
    v_pointid                NUMBER(20);
    v_audienceid             NUMBER(20);
    v_eventid                NUMBER(20);
    v_utcdate                TIMESTAMP;
    v_utcepoch               NUMBER;
    v_responsedate           TIMESTAMP;
    v_sentresponsedate       TIMESTAMP;
BEGIN
    SELECT
        ar.touchpointid,
        ar.audienceid,
        ar.eventid
    INTO
        v_pointid,
        v_audienceid,
        v_eventid
    FROM
        audienceresponse ar
    WHERE
        ar.id = p_audienceresponseid;

    SELECT
        p.journeyid,
        p.name
    INTO
        v_journeyid,
        v_pointname
    FROM
        point p
    WHERE
        p.id = v_pointid;

    v_utcepoch := get_utc_epoch();
    v_utcdate := get_date_from_utc_epoch(v_utcepoch);
    SELECT
        ja.email
    INTO v_audienceemail
    FROM
        journeyaudiences ja
    WHERE
        ja.id = v_audienceid;

    SELECT
        ep.channelagent,
        ep.connectorinfo
    INTO
        v_channelagent,
        v_connectorinfo
    FROM
        emailtouchpoint ep
    WHERE
        ep.id = v_pointid;

    IF v_channelagent = 1 THEN
        BEGIN
            v_channel := 'Deliver';
            SELECT
                dem.documentname
            INTO v_template
            FROM
                delivermetadata dem
            WHERE
                dem.touchpointid = v_pointid;

        EXCEPTION
            WHEN no_data_found THEN
                dbms_output.put_line('DOCUMENTID NOT FOUND IN DELIVERMETADATA FOR TOUCHPOINTID' || v_pointid);
                v_template := NULL;
        END;
    ELSIF v_channelagent = 0 THEN
        BEGIN
            SELECT
                lmd.documentname
            INTO v_template
            FROM
                linkmetadata lmd
            WHERE
                lmd.touchpointid = v_pointid;

        EXCEPTION
            WHEN no_data_found THEN
                dbms_output.put_line('DOCUMENTNAME NOT FOUND IN LINKMETADATA FOR TOUCHPOINTID' || v_pointid);
                v_template := NULL;
        END;

        BEGIN
            IF v_connectorinfo IS NULL THEN
                SELECT
                    dc.connectionname
                INTO v_connectorinfo
                FROM
                    defaultconnection dc
                WHERE
                    upper(dc.connectiontype) = 'EMAIL';

            END IF;

        EXCEPTION
            WHEN no_data_found THEN
                dbms_output.put_line('CONNECTIONNAME NOT FOUND IN DEFAULTCONNECTION');
                v_connectorinfo := '';
        END;

        v_channel := 'Link - ' || v_connectorinfo;
    END IF;

    CASE ( v_eventid )
        WHEN 2 THEN
            BEGIN
                SELECT
                    eps.senttimestampepoch
                INTO v_sentresponsetime
                FROM
                    emailperformancesent eps
                WHERE
                    eps.audienceid = v_audienceid
                    AND eps.pointid = v_pointid;

                v_responsedate := get_date_from_utc_epoch(p_responsetime);
                v_sentresponsedate := get_date_from_utc_epoch(v_sentresponsetime);
                SELECT
                    ( EXTRACT(DAY FROM diff) ) * 24 * 60 + ( EXTRACT(HOUR FROM diff) ) * 60 + ( EXTRACT(MINUTE FROM diff) ) total_mins
                INTO v_aveareinteartiontime
                FROM
                    (
                        SELECT
                            v_responsedate - v_sentresponsedate diff
                        FROM
                            dual
                    );

                IF v_aveareinteartiontime < 0 THEN
                    v_aveareinteartiontime := 0;
                END IF;
            EXCEPTION
                WHEN no_data_found THEN
                    dbms_output.put_line('NO SENT RESPONSETIME FOUND FOR AUDIENCEID '
                                         || v_audienceid
                                         || 'AND POINTID '
                                         || v_pointid);
                    v_aveareinteartiontime := 0;
                    v_error_msg := 'NO SENT RESPONSETIME FOUND FOR AUDIENCEID :: '
                                   || v_audienceid
                                   || ','
                                   || v_eventid
                                   || ','
                                   || v_pointid
                                   || ','
                                   || sqlerrm;

                    INSERT INTO journeydataerrors (
                        entrysourceid,
                        journeyid,
                        sourcetopic,
                        errormsg,
                        createddate,
                        createddateepoch,
                        version
                    ) VALUES (
                        v_audienceid,
                        v_journeyid,
                        'EMAIL_LINK_PERF',
                        v_error_msg,
                        v_utcdate,
                        v_utcepoch,
                        0
                    );

                WHEN OTHERS THEN
                    dbms_output.put_line('ERROR DURING CALCULATING AVERAGEOPENINTERACTIONTIME '
                                         || v_audienceid
                                         || 'AND POINTID '
                                         || v_pointid);
                    v_aveareinteartiontime := 0;
                    v_error_msg := 'ERROR DURING CALCULATING AVERAGEOPENINTERACTIONTIME :: '
                                   || v_audienceid
                                   || ','
                                   || v_eventid
                                   || ','
                                   || v_pointid
                                   || ','
                                   || sqlerrm;

                    INSERT INTO journeydataerrors (
                        entrysourceid,
                        journeyid,
                        sourcetopic,
                        errormsg,
                        createddate,
                        createddateepoch,
                        version
                    ) VALUES (
                        v_audienceid,
                        v_journeyid,
                        'EMAIL_LINK_PERF',
                        v_error_msg,
                        v_utcdate,
                        v_utcepoch,
                        0
                    );

            END;

            INSERT INTO emailperformancelinkclick (
                journeyid,
                pointid,
                pointname,
                audienceid,
                audienceemail,
                template,
                channel,
                linkid,
                linkurl,
                clicktimestamp,
                clicktimestampepoch,
                averageclickinteractiontime
            ) VALUES (
                v_journeyid,
                v_pointid,
                v_pointname,
                v_audienceid,
                v_audienceemail,
                v_template,
                v_channel,
                p_linkid,
                p_linkurl,
                v_responsedate,
                p_responsetime,
                v_aveareinteartiontime
            );

        ELSE
            dbms_output.put_line('INVALID EVENT ID' || v_eventid);
    END CASE;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR IN EMAIL_LINK_PERF ----' || sqlerrm);
        v_error_msg := 'ERROR IN EMAIL_PERF :: '
                       || 'AUDIENCERESPONSE'
                       || p_audienceresponseid
                       || ','
                       || v_audienceid
                       || ','
                       || v_eventid
                       || ','
                       || v_pointid
                       || ','
                       || sqlerrm;

        INSERT INTO journeydataerrors (
            entrysourceid,
            journeyid,
            sourcetopic,
            errormsg,
            createddate,
            createddateepoch,
            version
        ) VALUES (
            v_audienceid,
            v_journeyid,
            'EMAIL_LINK_PERF',
            v_error_msg,
            v_utcdate,
            v_utcepoch,
            0
        );

END email_link_perf;
/

-- *****************************************************************
-- This is After Insert Trigger on AudienceResponse, Based on SMS or
-- Email touchpoint it call SMS_PERF or EMAIL_PERF procedure.                  
-- *****************************************************************
create or replace  TRIGGER ar_report_ai AFTER
    INSERT ON audienceresponse
    FOR EACH ROW
DECLARE
    v_audienceresponseid   NUMBER(20);
    v_touchpointid         NUMBER(20);
    v_eventid              NUMBER(20);
    v_audienceid           NUMBER(20);
    v_responsetime         NUMBER;
    v_total                NUMBER;
BEGIN
    v_audienceresponseid := :new.id;
    v_audienceid := :new.audienceid;
    v_touchpointid := :new.touchpointid;
    v_eventid := :new.eventid;
    v_responsetime := :new.responsetimeepoch;
    v_total := 0;
    SELECT
        COUNT(*)
    INTO v_total
    FROM
        smstouchpoint sp
    WHERE
        sp.id = v_touchpointid;

    IF v_total > 0 THEN
        dbms_output.put_line('Trigger start and calling SMS_PERF for audienceresonseId: ' || v_audienceresponseid);
        sms_perf(v_audienceresponseid, v_touchpointid, v_audienceid, v_eventid, v_responsetime);
        dbms_output.put_line('Trigger and SMS_PERF complete for audienceresonseId: ' || v_audienceresponseid);
    ELSE
        dbms_output.put_line('Trigger start and calling EMAIL_PERF for audienceresonseId: ' || v_audienceresponseid);
        email_perf(v_audienceresponseid, v_touchpointid, v_audienceid, v_eventid, v_responsetime);
        dbms_output.put_line('Trigger and EMAIL_PERF complete for audienceresonseId: ' || v_audienceresponseid);
    END IF;

END;
/

-- *****************************************************************
-- This is After Insert Trigger on AudienceResponseMetaData, Based  on
-- Email touchpoint it call EMAIL_LINK_PERF procedure.                  
-- *****************************************************************
create or replace  TRIGGER armd_report_ai AFTER
    INSERT ON audienceresponsemetadata
    FOR EACH ROW
DECLARE
    v_audienceresponseid           NUMBER(20);
    v_audienceresponsemetadataid   NUMBER(20);
    v_responsetime                 NUMBER;
    v_linkid                       NUMBER(20, 0);
    v_linkurl                      VARCHAR2(250 CHAR);
BEGIN
    v_audienceresponsemetadataid := :new.id;
    v_audienceresponseid := :new.audienceresponseid;
    v_responsetime := :new.responsetimeepoch;
    v_linkid := :new.linkid;
    v_linkurl := :new.linkurl;
    dbms_output.put_line('Trigger start and calling EMAIL_LINK_PERF for audienceresonseId: ' || v_audienceresponseid);
    email_link_perf(v_audienceresponseid, v_audienceresponsemetadataid, v_responsetime, v_linkid, v_linkurl);
    dbms_output.put_line('Trigger and EMAIL_LINK_PERF complete for audienceresonseId: ' || v_audienceresponseid);
END;
/

ALTER TABLE DecisionSplitActionPoint ADD days Number(20) DEFAULT NULL ADD hours Number(20) DEFAULT NULL 
ADD minutes Number(20) DEFAULT NULL ADD delayTypeEnum VARCHAR2(20 CHAR) DEFAULT NULL ADD waitTillDate NUMBER DEFAULT NULL ;

CREATE TABLE CacheBackup(
        id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
        cacheName VARCHAR2(255 CHAR),
        cacheKey VARCHAR2(255 CHAR),
        cacheValue BLOB,
        sourcePoint VARCHAR2(255 CHAR),
        createdDateEpoch NUMBER,
        lastModifiedEpochDate NUMBER,
        version NUMBER(20),
        active NUMBER(1) DEFAULT 1 NOT NULL ENABLE,
        cacheKeyNameHash Number(30) NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT unique_cacheKeyNameHash UNIQUE(cacheKeyNameHash)
);

 CREATE TABLE RestTouchPoint(
	id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	isConnectorConfigured Number(1,0),
	requestPayloadType Number(1,0) NOT NULL,
	requestPayload CLOB,
	responseFieldMapping CLOB,
	authId Number(20),
	CONSTRAINT responseFieldMapping_json CHECK (responseFieldMapping IS JSON),
	FOREIGN KEY (id) REFERENCES Point (id),
	PRIMARY KEY (id)
)
;



CREATE TABLE AuthDetail(
	id NUMBER  GENERATED BY DEFAULT ON NULL AS IDENTITY,
	restUrl VARCHAR2(1000 CHAR),
	apiMethod  Number(1,0) NOT NULL,
	authType  Number(1,0) NOT NULL,
	createdDateEpoch NUMBER,
	version        NUMBER(20),
	PRIMARY KEY ( id )
)
;


CREATE TABLE BasicAuthDetail(
	id NUMBER  GENERATED BY DEFAULT ON NULL AS IDENTITY,
	userName VARCHAR2(250 CHAR),
	password VARCHAR2(250 CHAR),
	PRIMARY KEY ( id ),
	FOREIGN KEY (id) REFERENCES AuthDetail(id)
)
;

CREATE TABLE ApiKeyAuthDetail(
	id NUMBER  GENERATED BY DEFAULT ON NULL AS IDENTITY,
	keyName VARCHAR2(250 CHAR),
	header VARCHAR2(250 CHAR),
	PRIMARY KEY ( id ),
	FOREIGN KEY (id) REFERENCES AuthDetail(id)

)
;

CREATE TABLE OAuthDetail(
	id NUMBER  GENERATED BY DEFAULT ON NULL AS IDENTITY,
	clientId VARCHAR2(250 CHAR),
	clientSecret VARCHAR2(250 CHAR),
	accessTokenUrl VARCHAR2(1000 CHAR),
	userName VARCHAR2(250 CHAR),
	Password VARCHAR2(250 CHAR),
	PRIMARY KEY ( id ),
	FOREIGN KEY (id) REFERENCES AuthDetail(id)

)
;


CREATE TABLE ResponseEventMasterHTTPCode (
id               NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
eventMasterId    NUMBER(10),
httpresponsecode NUMBER(4),
description      VARCHAR2(500),
createdDateEpoch NUMBER,
version        NUMBER(20),
PRIMARY KEY ( id ),
FOREIGN KEY (eventMasterId) REFERENCES AudienceResponseEventMaster(id)
)
;

CREATE TABLE AudienceResponseHTTPDetail(
id                 NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
audienceResponseId NUMBER(10),
httpresponsecode   NUMBER(4),
errorMessage       VARCHAR2 (3000),
createdDateEpoch NUMBER,
version        NUMBER(20),
PRIMARY KEY ( id ),
FOREIGN KEY (audienceResponseId) REFERENCES AudienceResponse(id)
)
;


declare 
utcEpoch NUMBER := ( CAST ( systimestamp AT TIME ZONE 'UTC' AS DATE ) - DATE '1970-01-01' ) * 86400000; 
utcDate TIMESTAMP := to_timestamp('1970-01-01 00:00:00.0', 'YYYY-MM-DD HH24:MI:SS.FF') + numtodsinterval(utcEpoch / 1000 / 60, 'MINUTE');
infoEventId NUMBER;
successEventId NUMBER;
redirectEventId NUMBER;
clientEventId NUMBER;
serverEventId NUMBER;
begin
	--------- Rest touch point events
MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Informational responses (100â€“199)'  DISPLAYNAME, 'REST' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH) VALUES ('Informational responses (100â€“199)','Informational responses (100â€“199)','Informational responses (100â€“199)','Informational responses (100â€“199)','REST',0,utcDate,'HCL',1, utcEpoch);
MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Successful responses (200â€“299)'  DISPLAYNAME, 'REST' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH) VALUES ('Successful responses (200â€“299)','Successful responses (200â€“299)','Successful responses (200â€“299)','Successful responses (200â€“299)','REST', 0,utcDate,'HCL',1, utcEpoch);
MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Redirects (300â€“399)'  DISPLAYNAME, 'REST' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH) VALUES ('Redirects (300â€“399)','Redirects (300â€“399)','Redirects (300â€“399)','Redirects (300â€“399)','REST',0,utcDate,'HCL',1, utcEpoch);
MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Client errors (400â€“499)'  DISPLAYNAME, 'REST' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH) VALUES ('Client errors (400â€“499)','Client errors (400â€“499)','Client errors (400â€“499)','Client errors (400â€“499)','REST',0,utcDate,'HCL',1, utcEpoch);
MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Server errors (500â€“599)'  DISPLAYNAME, 'REST' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH) VALUES ('Server errors (500â€“599)','Server errors (500â€“599)','Server errors (500â€“599)','Server errors (500â€“599)','REST',0,utcDate,'HCL',1, utcEpoch);

select id into infoEventId from AUDIENCERESPONSEEVENTMASTER where DISPLAYNAME = 'Informational responses (100â€“199)' and EVENTCATEGORY= 'REST';
select id into successEventId from AUDIENCERESPONSEEVENTMASTER where DISPLAYNAME = 'Successful responses (200â€“299)' and EVENTCATEGORY= 'REST';	
select id into redirectEventId from AUDIENCERESPONSEEVENTMASTER where DISPLAYNAME = 'Redirects (300â€“399)' and EVENTCATEGORY= 'REST';
select id into clientEventId from AUDIENCERESPONSEEVENTMASTER where DISPLAYNAME = 'Client errors (400â€“499)' and EVENTCATEGORY= 'REST';	
select id into serverEventId from AUDIENCERESPONSEEVENTMASTER where DISPLAYNAME = 'Server errors (500â€“599)' and EVENTCATEGORY= 'REST';

-- Success

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 200 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
successEventId, 200,'OK',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 201 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
successEventId, 201,'Created',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 202 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
successEventId, 202,'Accepted',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 203 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
successEventId, 203,'Non-Authoritative Information',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 204 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
successEventId, 204,'No Content',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 205 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
successEventId, 205,'Reset Content',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 206 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
successEventId, 206,'Partial Content',  utcEpoch, 1);

-- ERROR

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 100 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
infoEventId,100,'Continue',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 101 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
infoEventId,101,'Switching Protocols',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 103 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
infoEventId,103,'Early Hints',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 300 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN  
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
redirectEventId, 300, 'Multiple Choices',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 301 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
redirectEventId, 301, 'Moved Permanently',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 302 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
redirectEventId, 302, 'Found',  utcEpoch, 1); 
 
MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 303 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
redirectEventId, 303, 'See Other',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 304 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
redirectEventId, 304, 'Not Modified',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 307 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
redirectEventId, 307, 'Temporary Redirect',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 308 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
redirectEventId, 308, 'Permanent Redirect',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 400 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 400, 'Bad Request',  utcEpoch, 1); 
 
MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 401 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 401, 'Unauthorized',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 402 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 402, 'Payment Required',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 403 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 403, 'Forbidden',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 404 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 404, 'Not Found',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 405 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 405, 'Method Not Allowed',  utcEpoch, 1); 
 
MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 406 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 406, 'Not Acceptable',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 407 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 407, 'Proxy Authentication Required',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 408 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 408, 'Request Timeout',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 409 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 409, 'Conflict',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 410 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 410, 'Gone',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 411 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 411, 'Length Required',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 412 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 412, 'Precondition Failed',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 413 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 413, 'Payload Too Large',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 414 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 414, 'URI Too Long',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 415 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 415, 'Unsupported Media Type',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 416 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 416, 'Range Not Satisfiable',  utcEpoch, 1);

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 417 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 417, 'Expectation Failed',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 418 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 418, 'I''m a teapot',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 422 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 422, 'Unprocessable Entity',  utcEpoch, 1); 


MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 425 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 425, 'Too Early',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 426 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 426, 'Upgrade Required',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 428 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 428, 'Precondition Required',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 429 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 429, 'Too Many Requests',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 431 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 431, 'Request Header Fields Too Large',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 451 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
clientEventId, 451, 'Unavailable For Legal Reasons',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 500 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
serverEventId, 500, 'Internal Server Error',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 501 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
serverEventId, 501, 'Not Implemented',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 502 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
serverEventId, 502, 'Bad Gateway',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 503 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
serverEventId, 503, 'Service Unavailable',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 504 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
serverEventId, 504, 'Gateway Timeout',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 505 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
serverEventId, 505, 'HTTP Version Not Supported',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 506 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
serverEventId, 506, 'Variant Also Negotiates',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 507 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
serverEventId, 507, 'Insufficient Storage',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 508 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
serverEventId, 508, 'Loop Detected',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 510 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
serverEventId, 510, 'Not Extended',  utcEpoch, 1); 

MERGE INTO ResponseEventMasterHTTPCode TGT USING (SELECT 511 HTTPRESPONSECODE from DUAL) SRC
ON (TGT.HTTPRESPONSECODE = SRC.HTTPRESPONSECODE) WHEN NOT MATCHED THEN 
Insert  (EVENTMASTERID,HTTPRESPONSECODE,DESCRIPTION,CREATEDDATEEPOCH,VERSION) values (
serverEventId, 511, 'Network Authentication Required',  utcEpoch, 1); 

commit;
end;
/
