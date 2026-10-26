CREATE TABLE IF NOT EXISTS articles (
  id BIGSERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL
);

INSERT INTO articles (id, title, body)
VALUES (1, 'Crystal routes', 'Persist useful records')
ON CONFLICT (id) DO NOTHING;
