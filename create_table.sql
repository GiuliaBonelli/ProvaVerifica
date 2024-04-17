CREATE TABLE Users (
    Id_user       CHAR (5) PRIMARY KEY
                           NOT NULL,
    name_user     TEXT     NOT NULL,
    surname_user  TEXT     NOT NULL,
    date_birthday DATE (8) NOT NULL
);

CREATE TABLE Track (
    name_track  VARCHAR PRIMARY KEY
                        NOT NULL,
    owner_track VARCHAR NOT NULL,
    date_upload DATE    NOT NULL
);

PRAGMA foreign_keys = 0;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM Playlist;

DROP TABLE Playlist;

CREATE TABLE Playlist (
    Id_playlist    CHAR (3) PRIMARY KEY
                            NOT NULL,
    name_playlist  TEXT     NOT NULL,
    owner_playlist CHAR (5) NOT NULL,
    name_track     VARCHAR  REFERENCES Track (name_track) 
);

INSERT INTO Playlist (
                         Id_playlist,
                         name_playlist,
                         owner_playlist
                     )
                     SELECT Id_playlist,
                            name_playlist,
                            owner_playlist
                       FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

PRAGMA foreign_keys = 1;
