-- 4.3
CREATE TABLE ShohinSaeki (
    shohin_id CHAR(4) NOT NULL,
    shohin_mei VARCHAR(100) NOT NULL,
    hanbai_tanka INTEGER,
    shiire_tanka INTEGER,
    saeki INTEGER,
    PRIMARY KEY (shohin_id)
);

INSERT INTO ShohinSaeki
SELECT shohin_id,
    shohin_mei,
    hanbai_tanka,
    shiire_tanka,
    hanbai_tanka - shiire_tanka
FROM Shohin;

-- 4.4
BEGIN TRANSACTION;

-- 1.
UPDATE ShohinSaeki
SET hanbai_tanka = 3000
WHERE shohin_mei = 'カッターシャツ';

-- 2
UPDATE ShohinSaeki
SET saeki = hanbai_tanka - shiire_tanka
WHERE shohin_mei = 'カッターシャツ';

COMMIT;