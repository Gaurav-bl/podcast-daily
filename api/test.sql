INSERT INTO CATEGORY(CAT_ID, CAT_NAME, CAT_IMG)
VALUES
(1, "Technology", "tech.png"),
(2, "Gaming", "game.jpg"),
(3, "Education", "edu.png"),
(4, "Comedy", "comedy.png");

INSERT INTO PODCAST(POD_NAME, POD_ID, POD_IMG, POD_STUDIO, POD_INFO, C_ID) 
VALUES
("Waveform: The MKBHD Podcast", 1, "wvfm.png", "Studio71", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore, architecto dicta tenetur ea animi laudantium obcaecati odit quaerat recusandae necessitatibus. Error nisi sint quia! Quisquam quo placeat nam sunt repellendus?", 1),
("The Joe Rogan Experience", 2, "joemama.jpg", "Joe Rogan", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquam accusantium voluptates, ut obcaecati aspernatur soluta minima magni ab, quam necessitatibus porro molestiae quo nobis quasi odio nemo dicta quos nesciunt.", 3),
("Awkwardly Social", 3, "awkward.png", "The Socially Awkwards", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Culpa ipsam reprehenderit non consectetur est soluta impedit repudiandae blanditiis placeat temporibus. Tenetur facilis temporibus unde tempore vel odit, earum quia quis.", 4),
("Life of Dimps", 4, "wvfm.png", "The Dim", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore, architecto dicta tenetur ea animi laudantium obcaecati odit quaerat recusandae necessitatibus. Error nisi sint quia! Quisquam quo placeat nam sunt repellendus?", 4),
("The Misfits Podcast", 5, "misfits.jpg", "Misfits Network", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Totam facere alias consectetur, eius expedita exercitationem illum unde? Facere ratione debitis illo recusandae. Id totam molestiae quisquam minus nesciunt? Voluptatum, animi?", 2),
("The Courage and Nadeshot Show", 6, "nadeshot.jpg", "100 Thieves", "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Velit aspernatur dignissimos porro eligendi asperiores ullam natus optio nihil tempora, saepe debitis delectus molestias. Tempora eum cum nobis quis cupiditate quisquam!", 2),
("Simple Ken", 7, "ken.jpg", "Kenny Sebastian", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit aliquam voluptate expedita facere porro aperiam id, fugit dolores accusamus perferendis ea ipsa. Quasi eveniet fugit libero et distinctio, delectus voluptatem.", 4),
("Talks at Google", 8, "google.jpg", "Talks at Google", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore, architecto dicta tenetur ea animi laudantium obcaecati odit quaerat recusandae necessitatibus. Error nisi sint quia! Quisquam quo placeat nam sunt repellendus?", 3),
("State of Mind", 9, "state.jpg", "Invisible Media", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore, architecto dicta tenetur ea animi laudantium obcaecati odit quaerat recusandae necessitatibus. Error nisi sint quia! Quisquam quo placeat nam sunt repellendus?", 3),
("Towards Data Science", 10, "data.jpg", "The TDS Team", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore, architecto dicta tenetur ea animi laudantium obcaecati odit quaerat recusandae necessitatibus. Error nisi sint quia! Quisquam quo placeat nam sunt repellendus?", 3);

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

UPDATE PODCAST SET POD_IMG='joemama.png' WHERE POD_ID="2";

UPDATE CATEGORY SET CAT_IMG='comedy.jpg' WHERE CAT_ID="4";

UPDATE PODCAST SET POD_NAME="Conan O'Brien Needs a Friend",POD_IMG='conan.jpg' WHERE POD_ID="4";

INSERT INTO PODCAST VALUES("HLTV Confirmed",11,"hltv.jpg","HLTV","Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore, architecto dicta tenetur ea animi laudantium obcaecati odit quaerat recusandae necessitatibus. Error nisi sint quia! Quisquam quo placeat nam sunt repellendus?",2);

INSERT INTO PODCAST VALUES("Lew Later",12,"lew.jpg","Lew Later","Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore, architecto dicta tenetur ea animi laudantium obcaecati odit quaerat recusandae necessitatibus. Error nisi sint quia! Quisquam quo placeat nam sunt repellendus?",1);

UPDATE STREAM SET STREAM_NAME="Spotify",STREAM_URL="https://open.spotify.com/show/6o81QuW22s5m2nfcXWjucc",STREAM_LOGO='spotify.png' WHERE STREAM_ID="1";
UPDATE STREAM SET STREAM_NAME="Spotify",STREAM_URL="https://open.spotify.com/show/4rOoJ6Egrf8K2IrywzwOMk?si=4LR9QVlHQri8WsTwelPdjQ",STREAM_LOGO='spotify.png' WHERE STREAM_ID="2";
UPDATE STREAM SET STREAM_NAME="Youtube",STREAM_URL="https://www.youtube.com/channel/UCn7jJfacODVJ31VWS9ZPqmw/playlists",STREAM_LOGO='youtube.png' WHERE STREAM_ID="3";
UPDATE STREAM SET STREAM_NAME="Apple Podcasts",STREAM_URL="https://podcasts.apple.com/us/podcast/conan-obrien-needs-a-friend/id1438054347",STREAM_LOGO='apple.png' WHERE STREAM_ID="4";
UPDATE STREAM SET STREAM_NAME="Spotify",STREAM_URL="https://open.spotify.com/artist/1cXi8ALPQCBHZbf0EgP4Ey",STREAM_LOGO='spotify.png' WHERE STREAM_ID="5";
UPDATE STREAM SET STREAM_NAME="Spotify",STREAM_URL="https://open.spotify.com/show/37RiOUemb1x9jG0Up7CTvt",STREAM_LOGO='spotify.png' WHERE STREAM_ID="6";
UPDATE STREAM SET STREAM_NAME="Spotify",STREAM_URL="https://open.spotify.com/show/6IVKMJnrVorjdJr8TdEfl4",STREAM_LOGO='spotify.png' WHERE STREAM_ID="7";
UPDATE STREAM SET STREAM_NAME="Google Podcasts",STREAM_URL="https://podcasts.google.com/feed/aHR0cHM6Ly90YWxrc2F0Z29vZ2xlLmxpYnN5bi5jb20vcnNz",STREAM_LOGO='googlepod.png' WHERE STREAM_ID="8";
UPDATE STREAM SET STREAM_NAME="Google Podcasts",STREAM_URL="https://podcasts.google.com/feed/aHR0cHM6Ly9hbmNob3IuZm0vcy8zNmI0ODQ0L3BvZGNhc3QvcnNz",STREAM_LOGO='googlepod.png' WHERE STREAM_ID="10";
UPDATE STREAM SET STREAM_NAME="Google Podcasts",STREAM_URL="https://podcasts.google.com/feed/aHR0cHM6Ly9mZWVkcy5zaW1wbGVjYXN0LmNvbS9Id19MeGs3MA?hl=en-IN",STREAM_LOGO='googlepod.png' WHERE STREAM_ID="9";

INSERT INTO STREAM VALUES("Spotify","https://open.spotify.com/show/4wsyCdTp4MkO51RCt69MJY",12,'spotify.png');

INSERT INTO STREAM VALUES("Spotify","https://open.spotify.com/show/2NgS8wZ7qDgN8GYvfNxP82",11,'spotify.png');