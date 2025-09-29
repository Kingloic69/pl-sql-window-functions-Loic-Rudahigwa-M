CREATE TABLE Viewers (
    viewer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    region VARCHAR2(50) NOT NULL
);

CREATE TABLE Shows (
    show_id NUMBER PRIMARY KEY,
    title VARCHAR2(200) NOT NULL,
    genre VARCHAR2(50) NOT NULL
);

CREATE TABLE View_Logs (
    log_id NUMBER PRIMARY KEY,
    viewer_id NUMBER NOT NULL,
    show_id NUMBER NOT NULL,
    view_date DATE NOT NULL,
    watch_time NUMBER NOT NULL,
    CONSTRAINT fk_view_logs_viewer FOREIGN KEY (viewer_id) REFERENCES Viewers(viewer_id),
    CONSTRAINT fk_view_logs_show FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);