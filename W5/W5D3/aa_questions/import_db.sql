PRAGMA foreign_keys = ON;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    replier_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (replier_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Jon', 'Zomora'),
  ('Darrick', 'Shin'),
  ('Anusha', 'Tuladhar'),
  ('Joshua', 'Zhao'),
  ('Mauricio', 'Lomeli'),
  ('Jimmy', 'Kuang');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Office hours', 'Will there be office hours this weekend?', 1),
  ('Public vs Private vs Protected', 'Explain the difference between Public Private and Protected', 1),
  ('Big O', 'Explain why Big O is and why we use it', 2),
  ('CSS', 'Did anyone get the part about the CSS selector?', 3);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 1),
  (5, 1),
  (4, 2),
  (5, 2),
  (4, 3),
  (5, 3),
  (4, 4),
  (5, 4),
  (6, 4);

INSERT INTO
  replies (question_id, parent_id, replier_id, body)
VALUES
  (2, NULL, 2, 'Private cannot be called with an explicit receiver. Public can.'),
  (4, NULL, 6, 'Use the > to select direct children of an element'),
  (4, 2, 3, 'Thanks uwu');

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (5, 1),
  (5, 2),
  (4, 3),
  (4, 4),
  (4, 2),
  (3, 2),
  (3, 1);








