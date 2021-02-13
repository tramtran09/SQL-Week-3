CREATE DATABASE IF NOT EXISTS clients;
USE clients;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
	id INT (11) NOT NULL auto_increment,
	username VARCHAR(40) NOT NULL,
	email VARCHAR(40),
	password VARCHAR(40) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE posts (
	id INT (11) NOT NULL AUTO_INCREMENT,
	user_id INT (11) NOT NULL,
	post TEXT,
	time_created datetime DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) references users (id)
);

CREATE TABLE comments(
	id INT (11) NOT NULL AUTO_INCREMENT,
	post_id INT (11) NOT NULL,
	user_id INT (11) NOT NULL,
	comment TEXT NOT NULL, 
	time_created datetime DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (post_id) references posts (id),
	FOREIGN KEY (user_id) references users (id)
);

SELECT * from users;
SELECT * from posts;
SELECT * FROM comments;

INSERT into users (username, email, password) values ('tramtran', 'tt@gmail.com', 'tt'), ('bob', 'bob@gmail.com', 'bobb');
INSERT into posts (post, user_id, time_created) values ('hello', 1, '2021-01-12 6:30:12');
INSERT into comments (post_id, user_id, comment, time_created) values (3, 2, 'learning how to code', '2021-01-12 6:32:20');