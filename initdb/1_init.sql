CREATE TABLE IF NOT EXISTS users
(
  id SERIAL NOT NULL,
  name VARCHAR(15) NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS articles
(
  id SERIAL NOT NULL,
  user_id SERIAL NOT NULL,
  thumbnail_id BIGINT,
  title TEXT NOT NULL,
  body TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id),

  FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS photos
(
  id SERIAL NOT NULL,
  article_id SERIAL NOT NULL,
  url TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id),

  FOREIGN KEY (article_id)
    REFERENCES articles (id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tags
(
  id SERIAL NOT NULL,
  name VARCHAR(15) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS articles_tags
(
  id SERIAL NOT NULL,
  article_id SERIAL NOT NULL,
  tag_id SERIAL NOT NULL,

  PRIMARY KEY (id),

  FOREIGN KEY (article_id)
    REFERENCES articles (id)
    ON DELETE CASCADE,
  
  FOREIGN KEY (tag_id)
    REFERENCES tags (id)
    ON DELETE CASCADE
);

INSERT INTO users 
  (id, name, password_hash)
VALUES 
  (1, 'user01', 'wqwjqlwjqwlqjwl'),
  (2, 'user02', ';fgsjfg;akg;k'),
  (3, 'user03', 'bslbbnaafaeew');

INSERT INTO articles
  (id, title, body, user_id)
VALUES
  (1, 'article01', 'これは、user01が投稿した記事です。', 1),
  (2, 'article02', 'これは、user02が投稿した記事です。', 2),
  (3, 'article03', 'これは、user03が投稿した記事です。', 3);

INSERT INTO tags
  (id, name)
VALUES
  (1, 'テストタグ'),
  (2, 'エイプリルドリーム'),
  (3, 'Hello World');
