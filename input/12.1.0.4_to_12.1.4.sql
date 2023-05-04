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

ALTER TABLE DelayActionPoint add useExpression Number(1) DEFAULT 0 add delayExpression CLOB add CONSTRAINT delayExpression_check CHECK (delayExpression IS JSON);

CREATE TABLE Template(
    id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	name VARCHAR2(250 CHAR),
	description  VARCHAR2(1024 CHAR),
	code VARCHAR2(11 CHAR),
	timeZone VARCHAR2(50 CHAR),
	journeyDesign  CLOB,
	dataDefinitionId Number(20),
	version Number(20),
	deduplicationStatus Number(2) NOT NULL,
	keyfields  VARCHAR2(1500 CHAR),
	link CLOB,
	sourceJourneyId Number(20),
	folderId Number(20),
	status Number(2),
	createdDateEpoch NUMBER,
	createdBy NUMBER(20),
	lastModifiedDateEpoch NUMBER, 
	lastModifiedBy NUMBER(20),

    FOREIGN KEY (dataDefinitionId) REFERENCES DataDefinitions (id),
    FOREIGN KEY (folderId) REFERENCES Folders (id),
    FOREIGN KEY (createdBy) REFERENCES Users (id),
	FOREIGN KEY (lastModifiedBy) REFERENCES Users (id),
	PRIMARY KEY (id),
	CONSTRAINT template_design_json CHECK (journeyDesign IS JSON),
    CONSTRAINT template_code_unique UNIQUE (code)
)
;

ALTER TABLE Journeys add templateId Number(20);
ALTER TABLE Point add templateId Number(20);
ALTER TABLE Point add status Number(2);

CREATE INDEX IDX_CB_CACHENAME ON CACHEBACKUP(CACHENAME);

--------- Deliver all email response events

CREATE TABLE AudienceResponseExtended(
		id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
		audienceResponseId Number(20) NOT NULL,
		associatedAttributes CLOB,
		isProcessed NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE,
		createdDate TIMESTAMP,
		createdBy VARCHAR2(200 CHAR),
	 	version Number(20),
		responseTimeEpoch NUMBER NOT NULL,
 		createdDateEpoch NUMBER,
		FOREIGN KEY (audienceResponseId) REFERENCES AudienceResponse(id),
		CONSTRAINT ensure_attribute_json CHECK (associatedAttributes IS JSON),
		PRIMARY KEY (id)	
);

CREATE TABLE EmailUnsubscribedList(
		id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
		emailId VARCHAR2(200 CHAR) NOT NULL,
		status VARCHAR2(200 CHAR) DEFAULT 0 NOT NULL,
		channelAgent VARCHAR2(50 CHAR),
		eventID Number(20) NOT NULL,
		audienceResponseId Number(20),
		audienceResponseExtendedId Number(20),
		createdBy VARCHAR2(200 CHAR) DEFAULT 'SYSTEM' NOT NULL ,
    	version Number(20),
		createdDate TIMESTAMP,
 		createdDateEpoch NUMBER NOT NULL,
 		modifiedDateTimeEpoch NUMBER ,
    	FOREIGN KEY (eventID) REFERENCES AudienceResponseEventMaster(id),
		FOREIGN KEY (audienceResponseId) REFERENCES AudienceResponse(id),
		CONSTRAINT unique_emailId UNIQUE (emailId),
		PRIMARY KEY (id)	
);

ALTER TABLE AudienceResponse add actedUpon NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE;

ALTER TABLE AudienceResponseEventMaster add flagDisplayForStats NUMBER(1,0) DEFAULT 1;
ALTER TABLE AudienceResponseEventMaster add acceptMultiple Number(1,0) DEFAULT 0;
ALTER TABLE AudienceResponseEventMaster add maxResponses NUMBER DEFAULT 0;
ALTER TABLE AudienceResponseEventMaster add actedUpon NUMBER(1,0) DEFAULT 0;
ALTER TABLE AudienceResponseEventMaster add eventHandlingAction VARCHAR(50 CHAR) DEFAULT 0;

update  AUDIENCERESPONSEEVENTMASTER set flagdisplayforstats=0 where eventname='linkedinnonstandard';

declare 
utcEpoch NUMBER := ( CAST ( systimestamp AT TIME ZONE 'UTC' AS DATE ) - DATE '1970-01-01' ) * 86400000; 
utcDate TIMESTAMP := to_timestamp('1970-01-01 00:00:00.0', 'YYYY-MM-DD HH24:MI:SS.FF') + numtodsinterval(utcEpoch / 1000 / 60, 'MINUTE');
begin
	
	MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Unsubscribe'  DISPLAYNAME, 'EMAIL' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,flagDisplayForStats,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH,EVENTHANDLINGACTION) VALUES ('Unsubscribe','Unsubscribe','unsubscribe','unsubscribe','EMAIL',0,1,utcDate,'HCL',1, utcEpoch,1);
	MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'ISP Feedback'  DISPLAYNAME, 'EMAIL' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,flagDisplayForStats,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH,EVENTHANDLINGACTION) VALUES ('ISP Feedback','ISP Feedback','ispfeedback','ispfeedback','EMAIL',0,1,utcDate,'HCL',1, utcEpoch,1); 
	MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Landing Page'  DISPLAYNAME, 'EMAIL' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,flagDisplayForStats,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH,EVENTHANDLINGACTION) VALUES ('Landing Page','Landing Page','landingpage','landingpage','EMAIL',0,1,utcDate,'HCL',1, utcEpoch,1);  
	MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Mail Bounce'  DISPLAYNAME, 'EMAIL' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,flagDisplayForStats,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH) VALUES ('Mail Bounce','Mail Bounce','bounce','bounce','EMAIL', 0,0,utcDate,'HCL',1, utcEpoch); 
	MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Inbound Email'  DISPLAYNAME, 'EMAIL' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,flagDisplayForStats,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH) VALUES ('Inbound Email','Inbound Email','inbondemail','inbondemail','EMAIL',0,0,utcDate,'HCL',1, utcEpoch); 
	MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Challenge'  DISPLAYNAME, 'EMAIL' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,flagDisplayForStats,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH) VALUES ('Challenge','Challenge','challangeresponse','challangeresponse','EMAIL',0,0,utcDate,'HCL',1, utcEpoch); 
	MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Address Change'  DISPLAYNAME, 'EMAIL' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,flagDisplayForStats,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH) VALUES ('Address Change','Address Change','addresschange','addresschange','EMAIL',0,0,utcDate,'HCL',1, utcEpoch); 
	MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Out of office'  DISPLAYNAME, 'EMAIL' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,flagDisplayForStats,CREATEDDATE,CREATEDBY,VERSION, CREATEDDATEEPOCH) VALUES ('Out of office','Out of office','ooo','ooo','EMAIL',0,0,utcDate,'HCL',1, utcEpoch); 
end;
/

declare 
utcEpoch NUMBER := ( CAST ( systimestamp AT TIME ZONE 'UTC' AS DATE ) - DATE '1970-01-01' ) * 86400000; 
utcDate TIMESTAMP := to_timestamp('1970-01-01 00:00:00.0', 'YYYY-MM-DD HH24:MI:SS.FF') + numtodsinterval(utcEpoch / 1000 / 60, 'MINUTE');
begin

    DELETE FROM CONTEXTSENSITIVEURLS;
    
	--------menuid 101
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '101' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (101,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/operations_on_existing_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '101' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (101,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/operations_on_existing_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '101' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (101,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/operations_on_existing_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 102
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '102' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (102,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/operations_on_existing_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '102' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (102,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/operations_on_existing_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '102' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (102,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/operations_on_existing_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 103
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '103' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (103,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/operations_on_existing_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '103' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (103,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/operations_on_existing_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '103' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (103,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/operations_on_existing_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 104
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '104' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (104,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/operations_on_existing_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '104' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (104,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/operations_on_existing_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '104' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (104,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/operations_on_existing_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 105
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '105' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (105,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/creating_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '105' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (105,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/creating_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '105' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (105,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/creating_journeys.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 106
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '106' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (106,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/designing_the_canvas.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '106' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (106,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/designing_the_canvas.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '106' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (106,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/designing_the_canvas.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 107
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '107' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (107,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/operations_on_entry_sources_listing_page.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '107' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (107,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/operations_on_entry_sources_listing_page.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '107' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (107,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/operations_on_entry_sources_listing_page.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 108
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '108' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (108,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/creating_entry_sources.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '108' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (108,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/creating_entry_sources.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '108' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (108,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/creating_entry_sources.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 109
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '109' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (109,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/modifying_an_entry_source.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '109' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (109,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/modifying_an_entry_source.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '109' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (109,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/modifying_an_entry_source.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 110
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '110' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (110,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/operations_on_data_definitions_listing_page.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '110' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (110,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/operations_on_data_definitions_listing_page.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '110' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (110,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/operations_on_data_definitions_listing_page.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 111
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '111' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (111,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/creating_data_definitions.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '111' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (111,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/creating_data_definitions.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '111' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (111,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/creating_data_definitions.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 112
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '112' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (112,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/modifying_a_data_definition.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '112' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (112,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/modifying_a_data_definition.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '112' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (112,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/modifying_a_data_definition.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 113
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '113' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (113,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/settings.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '113' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (113,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/settings.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '113' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (113,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/settings.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 114
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '114' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (114,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/setting_default_email_connection.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '114' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (114,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/setting_default_email_connection.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '114' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (114,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/setting_default_email_connection.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 115
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '115' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (115,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/setting_default_sms_connection.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '115' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (115,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/setting_default_sms_connection.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '115' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (115,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/setting_default_sms_connection.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 116
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '116' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (116,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/setting_default_crm_connection.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '116' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (116,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/setting_default_crm_connection.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '116' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (116,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/setting_default_crm_connection.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 117
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '117' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (117,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/rest_integration.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '117' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (117,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/rest_integration.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '117' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (117,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/rest_integration.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 118
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '118' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (118,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/creating_a_new_rest_integration.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '118' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (118,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/creating_a_new_rest_integration.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '118' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (118,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/creating_a_new_rest_integration.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	--------menuid 119
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '119' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (119,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/modifying_an_existing_rest_integration.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '119' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (119,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/modifying_an_existing_rest_integration.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '119' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (119,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/modifying_an_existing_rest_integration.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

    ----menuid 120
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '120' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (120,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/performance.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '120' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (120,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/performance.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '120' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (120,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/performance.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

    ----menuid 121
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '121' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (121,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/setting_a_default_adtech_connection_0.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '121' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (121,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/setting_a_default_adtech_connection_0.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '121' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (121,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/setting_a_default_adtech_connection_0.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

    ----menuid 122
	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '122' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (122,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/setting_a_default_jdbc_connection.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '122' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (122,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/setting_a_default_jdbc_connection.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '122' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
	ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
	THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (122,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/setting_a_default_jdbc_connection.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);
	
end;
/


ALTER TABLE JourneyDeliverResponseEvent add responseAttributes CLOB add CONSTRAINT  responseAttributes_check CHECK (responseAttributes IS JSON);	

CREATE INDEX IDX_EUL_EID ON EmailUnsubscribedList(status,emailId);

CREATE TABLE JourneyPartitionSettings(
        id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
        journeyId Number(20),
        mappingJSON CLOB,
        createdDateEpoch NUMBER,
        lastModifiedDateEpoch NUMBER,
        createdBy NUMBER(20),
        lastModifiedBy NUMBER(20),
        version Number(20),
        CONSTRAINT PartitionSettings_json CHECK (mappingJSON IS JSON),
        FOREIGN KEY (journeyId) REFERENCES Journeys (id),
        FOREIGN KEY (createdBy) REFERENCES Users (id),
        FOREIGN KEY (lastModifiedBy) REFERENCES Users (id),
        PRIMARY KEY (id)
);

CREATE TABLE OfferMetaData(
        id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
		touchPointId Number(20),
		offerId Number(20),
		variantId Number(20),
		variantName VARCHAR2(500 CHAR),
		offerCode VARCHAR2(200 CHAR),
		offerName VARCHAR2(200 CHAR),
		offerURL VARCHAR2(2000 CHAR),
		offerLinkId Number(20),
        offerAttributeJson CLOB,
        offerStaticAttributeJson CLOB,
        isActive NUMBER(1,0) DEFAULT 1,
        createdDateEpoch NUMBER,
        lastModifiedDateEpoch NUMBER,  
        VERSION NUMBER(20,0),
        CONSTRAINT OfferMetaData_json CHECK (offerAttributeJson IS JSON),
        CONSTRAINT OfferStaticAttribute_json CHECK (offerStaticAttributeJson IS JSON),
        FOREIGN KEY (touchPointId) REFERENCES Point (id),
        CONSTRAINT unique_offer_perpoint UNIQUE(touchPointId, offerId),
        PRIMARY KEY (id)
);

CREATE TABLE OffersHistory(
        id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
        offerMetaDataId Number(20),
		offerId Number(20),
		offerCRC Number(20),
		treatmentCode VARCHAR2(200 CHAR),
        offerAttributeJson CLOB,
        createdDateEpoch NUMBER, 
        VERSION NUMBER(20,0),
        CONSTRAINT OfferHistoryData_json CHECK (offerAttributeJson IS JSON),
        FOREIGN KEY (offerMetaDataId) REFERENCES OfferMetaData (id),
        CONSTRAINT unique_offer_history_perpoint UNIQUE(offerMetaDataId, offerCRC),
        PRIMARY KEY (id)
);
	
CREATE TABLE BatchOfferHistoryMap(
        id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
        batchId Number(20),
        offerHistoryId Number(20),
        createdDateEpoch NUMBER, 
        VERSION NUMBER(20,0),
        FOREIGN KEY (batchId) REFERENCES TOUCHPOINTBATCHES (id),
        FOREIGN KEY (offerHistoryId) REFERENCES OffersHistory (id),
        CONSTRAINT unique_batch_offerhistory UNIQUE(batchId, offerHistoryId),
        PRIMARY KEY (id)
);

CREATE TABLE NBOMetaData(
		id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
		touchPointId Number(20),
		channel VARCHAR2(250 CHAR),
		audienceLevel VARCHAR2(250 CHAR),
		interactionPoint VARCHAR2(250 CHAR),
		event VARCHAR2(250 CHAR),
		runtimeUrl VARCHAR2(250 CHAR),
		interactFieldMapping CLOB,
		createdDateEpoch NUMBER,
		lastModifiedDate NUMBER,
		VERSION NUMBER(20,0),
		CONSTRAINT NBOMetaData_json CHECK (interactFieldMapping IS JSON),
		FOREIGN KEY (touchPointId) REFERENCES Point (id),
		PRIMARY KEY (id)
);

ALTER TABLE EmailTouchPoint ADD offerType VARCHAR2(50 CHAR) DEFAULT 0 ;

Alter table TEMPLATELINKS modify LINKURL VARCHAR2(2000 CHAR);

update DelayActionPoint set useExpression = 0 where useExpression is null;

DELETE FROM journeyaudienceflow WHERE rowid not in (SELECT MIN(rowid) FROM journeyaudienceflow GROUP BY nodeId, audienceId, edge, direction);
ALTER TABLE journeyaudienceflow add audienceStage NUMBER(20) add CONSTRAINT aud_flow UNIQUE(nodeId, audienceId, audienceStage, edge, direction);
ALTER TABLE JourneyDeliverResponseEvent add responseCount NUMBER(20) DEFAULT 0 NOT NULL;
update journeyflow set edge = 0 where edge is null;
commit;



-- 12.1.1 to 12.1.2 -----------------------------------------------------------

declare 
utcEpoch NUMBER := ( CAST ( systimestamp AT TIME ZONE 'UTC' AS DATE ) - DATE '1970-01-01' ) * 86400000 ; 
utcDate TIMESTAMP := to_timestamp('1970-01-01 00:00:00.0', 'YYYY-MM-DD HH24:MI:SS.FF') + numtodsinterval(utcEpoch / 1000 / 60, 'MINUTE');

begin
MERGE INTO JourneyDateFormat TGT USING (SELECT 'dd-MM-yy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('dd-MM-yy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'dd-MM-yyyy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('dd-MM-yyyy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'dd-MMM-yy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('dd-MMM-yy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'dd-MMM-yyyy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('dd-MMM-yyyy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'MM-dd-yy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('MM-dd-yy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'MM-dd-yyyy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('MM-dd-yyyy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'MMM-dd-yy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('MMM-dd-yy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'MMM-dd-yyyy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('MMM-dd-yyyy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yy-dd-MM'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yy-dd-MM','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yyyy-dd-MM'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yyyy-dd-MM','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yy-MM-dd'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yy-MM-dd','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yyyy-MM-dd'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yyyy-MM-dd','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yy-dd-MMM'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yy-dd-MMM','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yyyy-dd-MMM'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yyyy-dd-MMM','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yy-MMM-dd'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yy-MMM-dd','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yyyy-MMM-dd'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yyyy-MMM-dd','',0,1,utcDate,'HCL',1, utcEpoch);

MERGE INTO JourneyDateFormat TGT USING (SELECT 'dd/MM/yy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('dd/MM/yy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'dd/MM/yyyy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('dd/MM/yyyy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'dd/MMM/yy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('dd/MMM/yy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'dd/MMM/yyyy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('dd/MMM/yyyy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'MM/dd/yy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('MM/dd/yy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'MM/dd/yyyy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('MM/dd/yyyy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'MMM/dd/yy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('MMM/dd/yy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'MMM/dd/yyyy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('MMM/dd/yyyy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yy/dd/MM'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yy/dd/MM','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yyyy/dd/MM'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yyyy/dd/MM','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yy/MM/dd'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yy/MM/dd','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yyyy/MM/dd'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yyyy/MM/dd','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yy/dd/MMM'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yy/dd/MMM','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yyyy/dd/MMM'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yyyy/dd/MMM','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yy/MMM/dd'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yy/MMM/dd','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yyyy/MMM/dd'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yyyy/MMM/dd','',0,1,utcDate,'HCL',1, utcEpoch);

MERGE INTO JourneyDateFormat TGT USING (SELECT 'dd.MM.yy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('dd.MM.yy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'dd.MM.yyyy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('dd.MM.yyyy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'dd.MMM.yy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('dd.MMM.yy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'dd.MMM.yyyy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('dd.MMM.yyyy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'MM.dd.yy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('MM.dd.yy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'MM.dd.yyyy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('MM.dd.yyyy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'MMM.dd.yy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('MMM.dd.yy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'MMM.dd.yyyy'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('MMM.dd.yyyy','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yy.dd.MM'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yy.dd.MM','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yyyy.dd.MM'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yyyy.dd.MM','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yy.MM.dd'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yy.MM.dd','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yyyy.MM.dd'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yyyy.MM.dd','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yy.dd.MMM'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yy.dd.MMM','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yyyy.dd.MMM'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yyyy.dd.MMM','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yy.MMM.dd'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yy.MMM.dd','',0,1,utcDate,'HCL',1, utcEpoch);
MERGE INTO JourneyDateFormat TGT USING (SELECT 'yyyy.MMM.dd'  format from DUAL) SRC ON (TGT.format = SRC.format) WHEN NOT MATCHED THEN INSERT (format,description,userCreated,isValid,createdDate,createdBy,version, createdDateEpoch) VALUES ('yyyy.MMM.dd','',0,1,utcDate,'HCL',1, utcEpoch);

MERGE INTO Folders TGT USING (SELECT 1  ORGANISATIONID, '/' FOLDERNAME,  3 FOLDERTYPE, 1 VERSION from DUAL) SRC ON (TGT.ORGANISATIONID = SRC.ORGANISATIONID AND TGT.FOLDERNAME = SRC.FOLDERNAME AND TGT.FOLDERTYPE = SRC.FOLDERTYPE AND TGT.VERSION = SRC.VERSION) WHEN NOT MATCHED THEN INSERT (organisationId,folderName, createdDate, parentFolderId, folderType, hitCount, version, lastModifiedDate, createdDateEpoch, lastModifiedDateEpoch) VALUES (1,'/', utcDate, null, 3, 0, 1, utcDate, utcEpoch, utcEpoch);

MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'PUSH_DELIVERED'  DISPLAYNAME, 'NOTIFY' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, createdDateEpoch,FLAGDISPLAYFORSTATS) VALUES ('PUSH_DELIVERED','Delivered','delivered','PUSH_DELIVERED','NOTIFY',1,utcDate,'HCL',1, utcEpoch,1);
MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'PUSH_READ'  DISPLAYNAME, 'NOTIFY' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY, flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, createdDateEpoch,FLAGDISPLAYFORSTATS) VALUES ('PUSH_READ','Read','read','PUSH_READ','NOTIFY',1,utcDate,'HCL',1, utcEpoch,1);
MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'PUSH_FAILED'  DISPLAYNAME, 'NOTIFY' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME  AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,  EVENTCATEGORY,flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, createdDateEpoch,FLAGDISPLAYFORSTATS) VALUES ('PUSH_FAILED','Failed','failed','PUSH_FAILED','NOTIFY',0,utcDate,'HCL',1, utcEpoch,1);
MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'PUSH_SENT'  DISPLAYNAME, 'NOTIFY' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY, flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, createdDateEpoch,FLAGDISPLAYFORSTATS) VALUES ('PUSH_SENT','Sent','sent','PUSH_SENT','NOTIFY',1,utcDate,'HCL',1, utcEpoch,1);

MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Waiting'  DISPLAYNAME, 'NOTIFY' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY, flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, createdDateEpoch,FLAGDISPLAYFORSTATS) VALUES ('Waiting','Waiting','Waiting','Waiting','NOTIFY',0, utcDate,'HCL',1, utcEpoch,1);
MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Waiting'  DISPLAYNAME, 'EMAIL' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY, flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, createdDateEpoch,FLAGDISPLAYFORSTATS) VALUES ('Waiting','Waiting','Waiting','Waiting','EMAIL',0, utcDate,'HCL',1, utcEpoch,1);
MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Waiting'  DISPLAYNAME, 'SMS' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY, flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, createdDateEpoch,FLAGDISPLAYFORSTATS) VALUES ('Waiting','Waiting','Waiting','Waiting','SMS',0, utcDate,'HCL',1, utcEpoch,1);
MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'Waiting'  DISPLAYNAME, 'WHATSAPP' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY, flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION, createdDateEpoch,FLAGDISPLAYFORSTATS) VALUES ('Waiting','Waiting','Waiting','Waiting','WHATSAPP',0, utcDate,'HCL',1, utcEpoch,1);

----menuid 123
MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '123' AS  MENUID, 'english' AS LOCALE FROM DUAL) SRC 
ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (123,'english','https://help.hcltechsw.com/unica/Journey/en/12.1.1/Journey/UserGuide/managing_connections.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '123' AS  MENUID, 'french' AS LOCALE FROM DUAL) SRC 
ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (123,'french','https://help.hcltechsw.com/unica/Journey/fr/12.1.1/Journey/UserGuide/managing_connections.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

MERGE INTO CONTEXTSENSITIVEURLS TGT USING (SELECT '123' AS  MENUID, 'german' AS LOCALE FROM DUAL) SRC 
ON (TGT.MENUID = SRC.MENUID AND TGT.LOCALE = SRC.LOCALE) WHEN NOT MATCHED 
THEN INSERT (MENUID,LOCALE,LINKURL,CREATEDDATE,CREATEDBY,MODIFIEDDATE,MODIFIEDBY,VERSION,createdDateEpoch,modifiedDateEpoch) VALUES (123,'german','https://help.hcltechsw.com/unica/Journey/de/12.1.1/Journey/UserGuide/managing_connections.html', utcDate,'HCL',utcDate,'HCL',1, utcEpoch, utcEpoch);

	
end;
/

ALTER TABLE NBOMetaData add offerAttributes CLOB;

ALTER TABLE Point ADD active Number DEFAULT 1 NOT NULL;

Alter table kafkaentrysource ADD kafkaTopicName VARCHAR2(255 CHAR);

ALTER table JourneyGoalMaster add templateId Number(20);
ALTER table JourneyGoalMaster modify (journeyId null);
ALTER table journeyMilestone add templateId Number(20);
ALTER table journeyMilestone modify (journeyId null);
ALTER table Template add flagMilestoneAdded NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE;

CREATE TABLE TemplateEntrySourceAssociation(
    id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    templateId Number(20),
    entrySourceId Number(20), 
    version Number(20),		
    status Int,
    createdDateEpoch NUMBER,
    FOREIGN KEY (templateId) REFERENCES Template (id),
    FOREIGN KEY (entrySourceId) REFERENCES EntrySources (id),
	PRIMARY KEY (id)
    );
CREATE TABLE NotificationTouchPoint(
		id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
		isConnectorConfigured Number(1,0),
		connectorInfo VARCHAR2(200 CHAR),
		dataFieldMapping CLOB,
		channelAgent VARCHAR(50 CHAR),
		isEdited Number(1,0) DEFAULT 0 NOT NULL ENABLE,
		CONSTRAINT NTFTouchPoint_json CHECK (dataFieldMapping IS JSON),
		FOREIGN KEY (id) REFERENCES Point (id),
		PRIMARY KEY (id)
	);

ALTER TABLE OFFERMETADATA DROP CONSTRAINT unique_offer_perpoint;

ALTER TABLE OFFERMETADATA add mailingInstanceId NUMBER(20) add CONSTRAINT unique_offer_perpoint_new UNIQUE(touchPointId, offerId, mailingInstanceId, offerLinkId);

UPDATE OFFERMETADATA t1 SET (mailingInstanceId) = (SELECT t2.mailingInstanceId FROM DELIVERMETADATA t2 WHERE t1.touchpointid = t2.touchpointid) WHERE EXISTS (SELECT 1 FROM DELIVERMETADATA t2 WHERE t1.touchpointid = t2.touchpointid);

ALTER TABLE DeliverMetaData add appId NUMBER(20) add appName VARCHAR(200 CHAR) add appKey VARCHAR(200 CHAR);

-- *****************************************************************
-- This procedure is used to process the historical responses when goal new goal added to journey.
-- @Param p_goalId IN 
-- *****************************************************************
create or replace  PROCEDURE process_journey_goals_hist (
    p_goalid IN NUMBER
) IS

    r_contact_goal                    journeygoalcontact%rowtype;
    r_jgct                            journeygoalcontacttransaction%rowtype;
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
    v_targeteventid                   NUMBER;
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
                select id into v_targeteventid from audienceresponseeventmaster where eventcategory = 'CRM' and eventname = 'true';
        -- POPULATE journeygoalsalestransactions TABLE BASED ON FREQUENCY

                IF r_journeygoalmaster.flagfrequencyenabled = 0 THEN
                    dbms_output.put_line('FREQUENCY IS NULL : ' || r_sales_goal.id);
                    IF NOT c_audienceresponse%isopen THEN
                        OPEN c_audienceresponse(r_sales_goal.targettouchpointid, v_targeteventid);
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

update audiencebulkresponse set updatecount = 0 where updatecount is null;

ALTER TABLE JOURNEYDELIVERRESPONSEEVENT modify(MAILINGSEQNUM null);
ALTER TABLE JOURNEYDELIVERRESPONSEEVENT DROP CONSTRAINT unique_deliver_event;
ALTER TABLE JOURNEYDELIVERRESPONSEEVENT add XID VARCHAR2(50 CHAR);
ALTER TABLE JOURNEYDELIVERRESPONSEEVENT add CONSTRAINT UNIQUE_DELIVER_EVENT UNIQUE(MAILINGINSTANCEID,MAILINGSEQNUM,TOUCHPOINTID,EVENT,LINKID,XID); 

ALTER TABLE JOURNEYDELIVERRESPONSEMASTER modify(MAILINGSEQNUM null);
ALTER TABLE JOURNEYDELIVERRESPONSEMASTER DROP CONSTRAINT unique_deliver_contact;
ALTER TABLE JOURNEYDELIVERRESPONSEMASTER add XID VARCHAR2(50 CHAR);
ALTER TABLE JOURNEYDELIVERRESPONSEMASTER add CONSTRAINT UNIQUE_DELIVER_CONTACT UNIQUE(MAILINGINSTANCEID,MAILINGSEQNUM,TOUCHPOINTID,XID); 

DECLARE
REPORT VARCHAR2(100); 
BEGIN
        REPORT := 'unica';
       	EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM ' || 'PUSHPERFORMANCEOPEN' || ' FOR ' || REPORT || '.' || 'PUSHPERFORMANCEOPEN';
        EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM ' || 'PUSHPERFORMANCEDELIVERY' || ' FOR ' || REPORT || '.' || 'PUSHPERFORMANCEDELIVERY';
        EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM ' || 'PUSHPERFORMANCESENT' || ' FOR ' || REPORT || '.' || 'PUSHPERFORMANCESENT';
		
END;
/

create or replace  PROCEDURE push_perf (
    p_audienceresponseid   IN   NUMBER,
    p_pointid              IN   NUMBER,
    p_audienceid           IN   NUMBER,
    p_eventid              IN   NUMBER,
    p_responsetime         IN   NUMBER
) IS

    v_journeyid              NUMBER(20);
    v_pointname              VARCHAR2(250);
    v_audiencemobile         VARCHAR(100);
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
        np.connectorinfo,
        np.channelagent
    INTO
        v_connectorinfo,
        v_channelagent
    FROM
        NotificationTouchPoint np
    WHERE
        np.id = p_pointid;

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
    
    END IF;

    v_responsedate := get_date_from_utc_epoch(p_responsetime);
	
    CASE ( p_eventid )
        WHEN 36 THEN
            BEGIN
                SELECT
                    pps.senttimestampepoch
                INTO v_sentresponsetime
                FROM
                    pushperformancesent pps
                WHERE
                    pps.audienceid = p_audienceid
                    AND pps.pointid = p_pointid;

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
                        'PUSH_PERF',
                        v_error_msg,
                        v_utcdate,
                        v_utcepoch,
                        0
                    );

            END;

            INSERT INTO pushperformanceopen (
                journeyid,
                pointid,
                pointname,
                audienceid,
                audiencemobilenumber,
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
                v_audiencemobile,
                v_template,
                v_channel,
                v_responsedate,
                p_responsetime,
                v_aveareinteartiontime
            );

        WHEN 35 THEN
            INSERT INTO pushperformancedelivery (
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

        WHEN 38 THEN
            INSERT INTO pushperformancesent (
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
        dbms_output.put_line('ERROR IN PUSH_PERF ----' || sqlerrm);
        v_error_msg := 'ERROR IN PUSH_PERF :: '
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
            'PUSH_PERF',
            v_error_msg,
            v_utcdate,
            v_utcepoch,
            0
        );

END push_perf;
/

create or replace  TRIGGER AR_REPORT_AI AFTER
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
		SELECT COUNT(*) INTO v_total FROM notificationtouchpoint np WHERE np.id = v_touchpointid;
		IF v_total > 0 THEN
			dbms_output.put_line('Trigger start and calling PUSH_PERF for audienceresonseId: ' || v_audienceresponseid);
			push_perf(v_audienceresponseid, v_touchpointid, v_audienceid, v_eventid, v_responsetime);
			dbms_output.put_line('Trigger and PUSH_PERF complete for audienceresonseId: ' || v_audienceresponseid);
		ELSE
			dbms_output.put_line('Trigger start and calling EMAIL_PERF for audienceresonseId: ' || v_audienceresponseid);
			email_perf(v_audienceresponseid, v_touchpointid, v_audienceid, v_eventid, v_responsetime);
			dbms_output.put_line('Trigger and EMAIL_PERF complete for audienceresonseId: ' || v_audienceresponseid);
		END IF;
	END IF;

END;
/

alter table Emailtouchpoint add followPreferences Number(1,0) DEFAULT 0 NOT NULL ENABLE;
alter table SmsTouchPoint add followPreferences Number(1,0) DEFAULT 0 NOT NULL ENABLE;
alter table WhatsAppTouchPoint add followPreferences Number(1,0) DEFAULT 0 NOT NULL ENABLE;
alter table NotificationTouchPoint add followPreferences Number(1,0) DEFAULT 0 NOT NULL ENABLE;

CREATE TABLE AudienceWaitState(
		id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
		touchPointId Number(20) NOT NULL,
		audienceId Number(20) NOT NULL,
		reason VARCHAR2(200 CHAR),
 		createdDateEpoch NUMBER,
 		version Number(20),
		PRIMARY KEY (id)
);

alter table journeys add regionalContactPreference Number(1,0) DEFAULT 0 NOT NULL ENABLE add globalPreferencesId NUMBER(20);

BEGIN 
	EXECUTE IMMEDIATE 'DROP TABLE PUSHTOUCHPOINT';
	EXCEPTION
	WHEN OTHERS THEN NULL;
END;
/

alter procedure push_perf compile;
commit;



-- 12.1.2 to 12.1.3 -----------------------------------------------------------

BEGIN
	BEGIN
	   EXECUTE IMMEDIATE 'drop index INDEX_JOURNEYAUDIENCES_JOURNEYID_STATUS';
	EXCEPTION
	   WHEN OTHERS
	   THEN
	   	  dbms_output.put_line('ERROR OCCURED WHILE DROPPING INDEX INDEX_JOURNEYAUDIENCES_JOURNEYID_STATUS');
	END;
	BEGIN
   		EXECUTE IMMEDIATE 'drop index INDEX_JA_JOURNEYID_STATUS';
	EXCEPTION
	   WHEN OTHERS
	   THEN
	   	  dbms_output.put_line('ERROR OCCURED WHILE DROPPING INDEX INDEX_JA_JOURNEYID_STATUS');
	END;
	BEGIN
   		EXECUTE IMMEDIATE 'drop index IDX_JAM_MID';
	EXCEPTION
	   WHEN OTHERS
	   THEN
	   	  dbms_output.put_line('ERROR OCCURED WHILE DROPPING INDEX IDX_JAM_MID');
	END;
	BEGIN
   		EXECUTE IMMEDIATE 'drop index INDEX_JAF_NODEID_DIR_ISPROC';
	EXCEPTION
	   WHEN OTHERS
	   THEN
	   	  dbms_output.put_line('ERROR OCCURED WHILE DROPPING INDEX INDEX_JAF_NODEID_DIR_ISPROC');
	END;
	BEGIN
   		EXECUTE IMMEDIATE 'drop index IDX_JAM_MID_AUDID';
	EXCEPTION
	   WHEN OTHERS
	   THEN
	   	  dbms_output.put_line('ERROR OCCURED WHILE DROPPING INDEX IDX_JAM_MID_AUDID');
	END;
	BEGIN
   		EXECUTE IMMEDIATE 'drop index IDX_P_JID_ACTIVE';
	EXCEPTION
	   WHEN OTHERS
	   THEN
	   	  dbms_output.put_line('ERROR OCCURED WHILE DROPPING INDEX IDX_P_JID_ACTIVE');
	END;
	BEGIN
   		EXECUTE IMMEDIATE 'drop index IDX_EUL_EID';
	EXCEPTION
	   WHEN OTHERS
	   THEN
	   	  dbms_output.put_line('ERROR OCCURED WHILE DROPPING INDEX IDX_EUL_EID');
	END;
END;
/

CREATE INDEX IDX_JA_JID ON JOURNEYAUDIENCES(JOURNEYID);

CREATE INDEX IDX_JM_JID ON JourneyMilestone(journeyId);

CREATE INDEX IDX_F_FT ON Folders(folderType);

CREATE INDEX IDX_J_FID ON journeys(folderId);
CREATE INDEX IDX_DD_FID ON DataDefinitions(folderId);
CREATE INDEX IDX_ES_FID ON EntrySources(folderId);
CREATE INDEX IDX_T_FID ON Template(folderId);

CREATE INDEX IDX_DDF_DDID ON DataDefinitionFields(dataDefinitionId);

CREATE INDEX IDX_JAM_MID ON JOURNEYAUDIENCEMILESTONE(MILESTONEID);

CREATE INDEX IDX_P_JID ON Point(journeyId);

CREATE INDEX IDX_AWS_TPID_AID ON AudienceWaitState(touchPointId, audienceId);

CREATE INDEX IDX_EUL_EID ON EmailUnsubscribedList(emailId, status);

CREATE INDEX IDX_OMD_TPID_MID_OLID ON offerMetaData(TOUCHPOINTID,MAILINGINSTANCEID,OFFERLINKID);
CREATE INDEX IDX_OH_OMDID ON offersHistory(OFFERMETADATAID);
CREATE INDEX IDX_OMD_TPID_MID ON offerMetaData(TOUCHPOINTID,MAILINGINSTANCEID);

alter table Template add regionalContactPreference Number(1,0) DEFAULT 0 NOT NULL ENABLE add globalPreferencesId NUMBER(20);

ALTER TABLE DataDefinitionFields add masked NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE;

ALTER TABLE DeliverMetaData add thumbnailURL VARCHAR2(500);

ALTER TABLE JourneyDataErrors add touchPointId NUMBER(20);

ALTER TABLE journeyflow DROP COLUMN createdBy;

ALTER TABLE journeyaudienceflow DROP COLUMN createdBy;

ALTER TABLE JourneyDiscardedData DROP COLUMN createdBy;

ALTER TABLE JourneyDateFormat DROP COLUMN createdBy;

UPDATE AUDIENCERESPONSEEVENTMASTER SET DISPLAYNAME = 'Informational responses (100-199)', STATISTICSLABEL = 'Informational responses (100-199)', EVENTNAME = 'Informational responses (100-199)', EVENTDESCRIPTION = 'Informational responses (100-199)' where DISPLAYNAME = 'Informational responses (100â€“199)' AND EVENTCATEGORY = 'REST';

UPDATE AUDIENCERESPONSEEVENTMASTER SET DISPLAYNAME = 'Successful responses (200-299)', STATISTICSLABEL = 'Successful responses (200-299)', EVENTNAME = 'Successful responses (200-299)', EVENTDESCRIPTION = 'Successful responses (200-299)' where DISPLAYNAME = 'Successful responses (200â€“299)' AND EVENTCATEGORY = 'REST';

UPDATE AUDIENCERESPONSEEVENTMASTER SET DISPLAYNAME = 'Redirects (300-399)', STATISTICSLABEL = 'Redirects (300-399)', EVENTNAME = 'Redirects (300-399)', EVENTDESCRIPTION = 'Redirects (300-399)' where DISPLAYNAME = 'Redirects (300â€“399)' AND EVENTCATEGORY = 'REST';

UPDATE AUDIENCERESPONSEEVENTMASTER SET DISPLAYNAME = 'Client errors (400-499)', STATISTICSLABEL = 'Client errors (400-499)', EVENTNAME = 'Client errors (400-499)', EVENTDESCRIPTION = 'Client errors (400-499)' where DISPLAYNAME = 'Client errors (400â€“499)' AND EVENTCATEGORY = 'REST';

UPDATE AUDIENCERESPONSEEVENTMASTER SET DISPLAYNAME = 'Server errors (500-599)', STATISTICSLABEL = 'Server errors (500-599)', EVENTNAME = 'Server errors (500-599)', EVENTDESCRIPTION = 'Server errors (500-599)' where DISPLAYNAME = 'Server errors (500â€“599)' AND EVENTCATEGORY = 'REST';

declare
startver number;
begin
select max(id) into startver from journeyaudiences;
if startver IS null then
startver := 1;
else
startver := startver +900;
end if;
dbms_output.put_line(startver);
execute IMMEDIATE 'CREATE SEQUENCE ja_seq START WITH ' || startver || ' INCREMENT BY 900 CACHE 900';
end;
/

declare
startver number;
begin
select max(id) into startver from journeyaudienceflow;
if startver IS null then
startver := 1;
else
startver := startver +900;
end if;
dbms_output.put_line(startver);
execute IMMEDIATE 'CREATE SEQUENCE jaf_seq START WITH ' || startver || ' INCREMENT BY 900 CACHE 900';
end;
/

declare
startver number;
begin
select max(id) into startver from JOURNEYDELIVERRESPONSEMASTER;
if startver IS null then
startver := 1;
else
startver := startver +1000;
end if;
dbms_output.put_line(startver);
execute IMMEDIATE 'CREATE SEQUENCE jdrm_seq START WITH ' || startver || ' INCREMENT BY 1000 CACHE 1000';
end;
/

CREATE TABLE endjourneyaudience(
	id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	journeyId Number(20),
	entrySourceId Number(20),
	mobileNumber VARCHAR2(20 CHAR),
	email VARCHAR2(100 CHAR),
	createdDate TIMESTAMP,
	keyField VARCHAR2(40 CHAR),
	version Number(20),
	detail CLOB,
	status VARCHAR2(20 CHAR),
	goalStatus VARCHAR2(100 CHAR),
	createdDateEpoch NUMBER,
	FOREIGN KEY (journeyId) REFERENCES Journeys (id),
	CONSTRAINT EndJourneyAudience_json CHECK (detail IS JSON),
	PRIMARY KEY (id)
);

CREATE VIEW journeyaudienceview AS
SELECT * FROM journeyaudiences
UNION ALL
SELECT * FROM endjourneyaudience;

DECLARE
name VARCHAR2(200);
tab_name VARCHAR2(200);
CURSOR c_constraint_fk
IS
SELECT constraint_name, table_name
FROM user_constraints NATURAL
JOIN user_cons_columns
WHERE lower(table_name) IN ('journeyaudiences','audienceresponse','audienceresponsemetadata', 'audienceresponseinteraction','journeyaudiencegoal','journeyaudiencemilestone')
AND column_name IN( 'AUDIENCEID' ,'JOURNEYID')
AND constraint_type = 'R';
BEGIN
IF NOT c_constraint_fk%isopen THEN
OPEN c_constraint_fk;
END IF;
LOOP
FETCH c_constraint_fk INTO name, tab_name;
EXIT
WHEN c_constraint_fk%notfound;
EXECUTE immediate 'alter table "' || tab_name || '" drop constraint "' || name || '"';
END LOOP;
COMMIT;
CLOSE c_constraint_fk;
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
        journeyaudienceview ja
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
        journeyaudienceview ja
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
        journeyaudienceview ja
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
-- This procedure call on every after insert in AudienceResponse for,
-- PUSH touchpoint, based on Event (OPEN,SENT,DELIVERED,
-- SOFT/HARD BOUNCE) it popuate Report schema tables.
-- @Params - AUDIENCERESPONSEID IN, TOUCHPOINTID IN, AUDIENCEID IN,
-- EVENTID IN, RESPONSETIME IN
-- *****************************************************************
create or replace  PROCEDURE push_perf (
    p_audienceresponseid   IN   NUMBER,
    p_pointid              IN   NUMBER,
    p_audienceid           IN   NUMBER,
    p_eventid              IN   NUMBER,
    p_responsetime         IN   NUMBER
) IS

    v_journeyid              NUMBER(20);
    v_pointname              VARCHAR2(250);
    v_audiencemobile         VARCHAR(100);
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
        journeyaudienceview ja
    WHERE
        ja.id = p_audienceid;

    SELECT
        np.connectorinfo,
        np.channelagent
    INTO
        v_connectorinfo,
        v_channelagent
    FROM
        NotificationTouchPoint np
    WHERE
        np.id = p_pointid;

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
    
    END IF;

    v_responsedate := get_date_from_utc_epoch(p_responsetime);
	
    CASE ( p_eventid )
        WHEN 36 THEN
            BEGIN
                SELECT
                    pps.senttimestampepoch
                INTO v_sentresponsetime
                FROM
                    pushperformancesent pps
                WHERE
                    pps.audienceid = p_audienceid
                    AND pps.pointid = p_pointid;

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
                        'PUSH_PERF',
                        v_error_msg,
                        v_utcdate,
                        v_utcepoch,
                        0
                    );

            END;

            INSERT INTO pushperformanceopen (
                journeyid,
                pointid,
                pointname,
                audienceid,
                audiencemobilenumber,
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
                v_audiencemobile,
                v_template,
                v_channel,
                v_responsedate,
                p_responsetime,
                v_aveareinteartiontime
            );

        WHEN 35 THEN
            INSERT INTO pushperformancedelivery (
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

        WHEN 38 THEN
            INSERT INTO pushperformancesent (
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
        dbms_output.put_line('ERROR IN PUSH_PERF ----' || sqlerrm);
        v_error_msg := 'ERROR IN PUSH_PERF :: '
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
            'PUSH_PERF',
            v_error_msg,
            v_utcdate,
            v_utcepoch,
            0
        );

END push_perf;
/

UPDATE journeydeliverresponsemaster SET XID = 'NA' WHERE XID IS NULL;
ALTER TABLE JourneyDeliverResponseMaster modify( xid varchar2(50 CHAR) default 'NA' NOT NULL );



-- 12.1.3 to 12.1.4 -----------------------------------------------------------

-- *****************************************************************
-- This procedure is used to process the journey goal based on every 
-- audience response.
-- @Param AUDIENCEID IN,EVENTID INTOUCHPOINTID IN
-- *****************************************************************
CREATE OR REPLACE PROCEDURE process_journey_goals (
    p_audienceid   IN NUMBER,
    p_eventid      IN NUMBER,
    p_touchointid  IN NUMBER,
    p_responsetime NUMBER
) IS

    v_journeyid         NUMBER(20);
    v_error_msg         VARCHAR(500);
    v_eventname         VARCHAR(250);
    v_utcdate           TIMESTAMP;
    v_utcepoch          NUMBER;
    v_responsedate      TIMESTAMP;
    r_contact_goal      journeygoalcontact%rowtype;
    r_sales_goal        journeygoalsales%rowtype;
    CURSOR c_journeygoalmaster IS
    SELECT
        jgm.*
    FROM
        journeygoalmaster jgm
    WHERE
        jgm.journeyid = v_journeyid;

    r_journeygoalmaster c_journeygoalmaster%rowtype;
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

            IF v_eventname NOT IN ( 'LINK_CLICK_EMAIL', 'LINK_CLICK_SMS' ) THEN
                BEGIN
                    dbms_output.put_line('CONTACT BASED GOAL : '
                                         || r_journeygoalmaster.id
                                         || ','
                                         || p_touchointid
                                         || ','
                                         || p_eventid);

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

                    WHEN OTHERS THEN
                        dbms_output.put_line('ERROR IN JOURNEYGOALCONTACT');
                        v_error_msg := 'ERROR IN JOURNEYGOALCONTACT :: '
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

                SELECT
                    jgs.*
                INTO r_sales_goal
                FROM
                    journeygoalsales jgs
                WHERE
                    id = r_journeygoalmaster.id
                    AND targettouchpointid = p_touchointid;

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

                WHEN OTHERS THEN
                    dbms_output.put_line('ERROR IN JOURNEYGOALSALES');
                    v_error_msg := 'ERROR IN JOURNEYGOALSALES :: '
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
-- audience response.
-- @Param p_audienceresponsemetaid IN ,p_link_url IN , p_responsetime IN
-- *****************************************************************
create or replace PROCEDURE process_journey_goals_meta (
    p_audienceresponsemetaid   IN   NUMBER,
    p_link_url                 IN   VARCHAR2,
    p_responsetime             NUMBER
) IS
    r_contact_goal        journeygoalcontact%rowtype;
    v_audienceid          NUMBER(20);
    v_eventid             NUMBER(20);
    v_touchpointid        NUMBER(20);
    v_journeyid           NUMBER(20);
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
                WHEN OTHERS THEN
                    dbms_output.put_line('ERROR IN JOURNEYGOALCONTACT');
                    v_error_msg := 'ERROR IN JOURNEYGOALCONTACT :: '
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
create or replace PROCEDURE process_journey_goals_hist (
    p_goalid IN NUMBER
) IS

    r_contact_goal                    journeygoalcontact%rowtype;
    r_sales_goal                      journeygoalsales%rowtype;
    r_audienceresponse                audienceresponse%rowtype;
    v_journeyid                       NUMBER(20);
    v_error_msg                       VARCHAR(500);
    v_targeturl                       VARCHAR(500);
    v_eventname                       VARCHAR(250);
    v_targeteventid                   NUMBER;
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
                    dbms_output.put_line('ERROR IN JOURNEYGOALCONTACT');
                    v_error_msg := 'ERROR IN JOURNEYGOALCONTACT :: '
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
                select id into v_targeteventid from audienceresponseeventmaster where eventcategory = 'CRM' and eventname = 'true';

                IF r_journeygoalmaster.flagfrequencyenabled = 0 THEN
                    dbms_output.put_line('FREQUENCY IS NULL : ' || r_sales_goal.id);
                    IF NOT c_audienceresponse%isopen THEN
                        OPEN c_audienceresponse(r_sales_goal.targettouchpointid, v_targeteventid);
                    END IF;

                    LOOP
                        FETCH c_audienceresponse INTO r_audienceresponse;
                        EXIT WHEN c_audienceresponse%notfound;
                      
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
                WHEN OTHERS THEN
                    dbms_output.put_line('ERROR IN JOURNEYGOALSALES');
                    v_error_msg := 'ERROR IN JOURNEYGOALSALES :: '
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
    v_eventcategory  VARCHAR2(250 CHAR);
BEGIN
	v_eventid := :new.eventid;
    select eventcategory into v_eventcategory  from audienceresponseeventmaster where id = v_eventid;
	IF (v_eventcategory !='REST') THEN
        v_audienceid := :new.audienceid;
        v_touchpointid := :new.touchpointid;
        v_responsetime := :new.responsetimeepoch;
        process_journey_goals(v_audienceid, v_eventid, v_touchpointid, v_responsetime);
    END IF;
END;
/

-- *****************************************************************
-- This is After Insert Trigger on AudienceResponse, Based on SMS or
-- Email touchpoint it call SMS_PERF or EMAIL_PERF procedure.                  
-- *****************************************************************
create or replace  TRIGGER AR_REPORT_AI AFTER
    INSERT ON audienceresponse
    FOR EACH ROW
DECLARE
    v_audienceresponseid   NUMBER(20);
    v_touchpointid         NUMBER(20);
    v_eventid              NUMBER(20);
    v_audienceid           NUMBER(20);
    v_responsetime         NUMBER;
    v_total                NUMBER;
    v_eventcategory        VARCHAR2(250 CHAR);
BEGIN
	v_eventid := :new.eventid;
    select eventcategory into v_eventcategory  from audienceresponseeventmaster where id = v_eventid;
	IF (v_eventcategory !='REST') THEN
	    v_audienceresponseid := :new.id;
	    v_audienceid := :new.audienceid;
	    v_touchpointid := :new.touchpointid;
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
			SELECT COUNT(*) INTO v_total FROM notificationtouchpoint np WHERE np.id = v_touchpointid;
			IF v_total > 0 THEN
				dbms_output.put_line('Trigger start and calling PUSH_PERF for audienceresonseId: ' || v_audienceresponseid);
				push_perf(v_audienceresponseid, v_touchpointid, v_audienceid, v_eventid, v_responsetime);
				dbms_output.put_line('Trigger and PUSH_PERF complete for audienceresonseId: ' || v_audienceresponseid);
			ELSE
				dbms_output.put_line('Trigger start and calling EMAIL_PERF for audienceresonseId: ' || v_audienceresponseid);
				email_perf(v_audienceresponseid, v_touchpointid, v_audienceid, v_eventid, v_responsetime);
				dbms_output.put_line('Trigger and EMAIL_PERF complete for audienceresonseId: ' || v_audienceresponseid);
			END IF;
		END IF;
	END IF;
END;
/

ALTER TABLE EmailTouchPoint add landingPageDataFieldMapping CLOB add CONSTRAINT landingPageMapping_json CHECK (landingPageDataFieldMapping IS JSON);

ALTER TABLE OfferMetaData add communicationChannel VARCHAR2(500 CHAR);

Alter table JOURNEYAUDIENCES DISABLE constraint JourneyAudience_json;

declare
utcEpoch NUMBER := ( CAST ( systimestamp AT TIME ZONE 'UTC' AS DATE ) - DATE '1970-01-01' ) * 86400000 ; 
utcDate TIMESTAMP := to_timestamp('1970-01-01 00:00:00.0', 'YYYY-MM-DD HH24:MI:SS.FF') + numtodsinterval(utcEpoch / 1000 / 60, 'MINUTE');

begin

MERGE INTO AUDIENCERESPONSEEVENTMASTER TGT USING (SELECT 'JDBC_SENT'  DISPLAYNAME, 'JDBC' EVENTCATEGORY from DUAL) SRC ON (TGT.DISPLAYNAME = SRC.DISPLAYNAME AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY AND TGT.EVENTCATEGORY = SRC.EVENTCATEGORY) 
WHEN NOT MATCHED THEN INSERT (DISPLAYNAME,STATISTICSLABEL,EVENTNAME,EVENTDESCRIPTION,EVENTCATEGORY,flagDisplayForGoal,CREATEDDATE,CREATEDBY,VERSION,createdDateEpoch,FLAGDISPLAYFORSTATS) 
VALUES ('JDBC_SENT','Sent','sent','JDBC_SENT','JDBC',0,utcDate,'HCL',1, utcEpoch,0);

commit;
end;
/
