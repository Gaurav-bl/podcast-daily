INSERT INTO CATEGORY(CAT_ID, CAT_NAME, CAT_IMG)
VALUES
(1, "Technology", "wvfm.png"),
(2, "Gaming", "wvfm.png"),
(3, "Education", "wvfm.png"),
(4, "Comedy", "wvfm.png");

INSERT INTO PODCAST(POD_NAME, POD_ID, POD_IMG, POD_STUDIO, POD_INFO, C_ID) 
VALUES
("Waveform: The MKBHD Podcast", 1, "wvfm.png", "Studio71", "", 1),
("The Joe Rogan Experience", 2, "joemama.jpg", "Joe Rogan", "", 3),
("Awkwardly Social", 3, "wvfm.png", "The Socially Awkwards", "", 4),
("Life of Dimps", 4, "wvfm.png", "The Dim", "", 4),
("The Misfits Podcast", 5, "wvfm.png", "Misfits Network", "", 2),
("The Courage and Nadeshot Show", 6, "wvfm.png", "100 Thieves", "", 2),
("Simple Ken", 7, "wvfm.png", "Kenny Sebastian", "", 4),
("Talks at Google", 8, "wvfm.png", "Talks at Google", "", 3),
("State of Mind", 9, "wvfm.png", "Invisible Media", "", 3),
("Towards Data Science", 10, "wvfm.png", "The TDS Team", "", 3);

INSERT INTO STREAM(STREAM_NAME, STREAM_URL, STREAM_ID, STREAM_LOGO)
VALUES
("Spotify", "", 1, "wvfm.png"),
("Spotify", "", 2, "wvfm.png"),
("Spotify", "", 3, "wvfm.png"),
("Spotify", "", 4, "wvfm.png"),
("Spotify", "", 5, "wvfm.png"),
("Spotify", "", 6, "wvfm.png"),
("Spotify", "", 7, "wvfm.png"),
("Spotify", "", 8, "wvfm.png"),
("Spotify", "", 9, "wvfm.png"),
("Spotify", "", 10, "wvfm.png");

INSERT INTO USERS(USER_ID, EMAIL, PASSWORD)
VALUES
("averyc", "averyc@test.com", "password"),
("jackie", "jackie@test.com", "password"),
("dexter", "dexter@test.com", "password"),
("coleman", "coleman@test.com", "password"),
("gloria", "gloria@test.com", "password"),
("kath", "katherine@test.com", "password"),
("cullen", "cullen@test.com", "password"),
("harvey", "harvey@test.com", "password"),
("janessa", "janessa@test.com", "password"),
("kerri", "kerri@test.com", "password"),
("gretchen", "gretchen@test.com", "password");


INSERT INTO USER_RATED(USER_ID, POD_ID, RATING, REVIEW) VALUES("averyc", 1, 5.0, "very good");
INSERT INTO USER_RATED(USER_ID, POD_ID, RATING, REVIEW) VALUES("jackie", 1, 4.0, "very nice");
INSERT INTO USER_RATED(USER_ID, POD_ID, RATING, REVIEW) VALUES("dexter", 1, 4.5, "very cool");
INSERT INTO USER_RATED(USER_ID, POD_ID, RATING, REVIEW) VALUES("dexter", 2, 3.5, "very cool");
INSERT INTO USER_RATED(USER_ID, POD_ID, RATING, REVIEW) VALUES("dexter", 3, 4.5, "very cool");
INSERT INTO USER_RATED(USER_ID, POD_ID, RATING, REVIEW) VALUES("dexter", 4, 2.5, "very cool");
INSERT INTO USER_RATED(USER_ID, POD_ID, RATING, REVIEW) VALUES("dexter", 5, 3.5, "very cool");
INSERT INTO USER_RATED(USER_ID, POD_ID, RATING, REVIEW) VALUES("cullen", 1, 3.5, "very cool");
INSERT INTO USER_RATED(USER_ID, POD_ID, RATING, REVIEW) VALUES("cullen", 4, 3.5, "very cool");
INSERT INTO USER_RATED(USER_ID, POD_ID, RATING, REVIEW) VALUES("cullen", 3, 3.5, "very cool");