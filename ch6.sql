-- 6-1
-- 算術関数
-- DDL
CREATE TABLE SampleMath (m NUMERIC (10, 3), n INTEGER, p INTEGER);

-- DML
BEGIN TRANSACTION;

INSERT INTO SampleMath(m, n, p)
VALUES (500, 0, NULL);

INSERT INTO SampleMath(m, n, p)
VALUES (-180, 0, NULL);

INSERT INTO SampleMath(m, n, p)
VALUES (NULL, NULL, NULL);

INSERT INTO SampleMath(m, n, p)
VALUES (NULL, 7, 3);

INSERT INTO SampleMath(m, n, p)
VALUES (NULL, 5, 2);

INSERT INTO SampleMath(m, n, p)
VALUES (NULL, 4, NULL);

INSERT INTO SampleMath(m, n, p)
VALUES (8, NULL, 3);

INSERT INTO SampleMath(m, n, p)
VALUES (2.27, 1, NULL);

INSERT INTO SampleMath(m, n, p)
VALUES (5.555, 2, NULL);

INSERT INTO SampleMath(m, n, p)
VALUES (NULL, 1, NULL);

INSERT INTO SampleMath(m, n, p)
VALUES (8.76, NULL, NULL);

COMMIT;

-- 文字列関数
-- DDL：テーブル作成
CREATE TABLE SampleStr (
    str1 VARCHAR(40),
    str2 VARCHAR(40),
    str3 VARCHAR(40)
);

-- DML：データ登録
BEGIN TRANSACTION;

INSERT INTO SampleStr (str1, str2, str3)
VALUES ('あいう', 'えお', NULL);

INSERT INTO SampleStr (str1, str2, str3)
VALUES ('abc', 'def', NULL);

INSERT INTO SampleStr (str1, str2, str3)
VALUES ('山田', '太郎', 'です');

INSERT INTO SampleStr (str1, str2, str3)
VALUES ('aaa', NULL, NULL);

INSERT INTO SampleStr (str1, str2, str3)
VALUES (NULL, 'あああ', NULL);

INSERT INTO SampleStr (str1, str2, str3)
VALUES ('@!#$%', NULL, NULL);

INSERT INTO SampleStr (str1, str2, str3)
VALUES ('ABC', NULL, NULL);

INSERT INTO SampleStr (str1, str2, str3)
VALUES ('aBC', NULL, NULL);

INSERT INTO SampleStr (str1, str2, str3)
VALUES ('abc太郎', 'abc', 'ABC');

INSERT INTO SampleStr (str1, str2, str3)
VALUES ('abcdefabc', 'abc', 'ABC');

INSERT INTO SampleStr (str1, str2, str3)
VALUES ('ミックマック', 'ッ', 'っ');

COMMIT;

-- 6-2
-- DDL：テーブル作成
CREATE TABLE SampleLike (
    strcol VARCHAR(6) NOT NULL,
    PRIMARY KEY (strcol)
);

-- DML：データ登録
BEGIN TRANSACTION;

INSERT INTO SampleLike (strcol)
VALUES ('abcddd');

INSERT INTO SampleLike (strcol)
VALUES ('dddabc');

INSERT INTO SampleLike (strcol)
VALUES ('abdddc');

INSERT INTO SampleLike (strcol)
VALUES ('abcdd');

INSERT INTO SampleLike (strcol)
VALUES ('ddabc');

INSERT INTO SampleLike (strcol)
VALUES ('abddc');

COMMIT;

-- 6-3
-- 検索CASE
SELECT shohin_mei,
    CASE
        WHEN shohin_bunrui = '衣服' THEN 'A:' || shohin_bunrui
        WHEN shohin_bunrui = '事務用品' THEN 'B:' || shohin_bunrui
        WHEN shohin_bunrui = 'キッチン用品' THEN 'C:' || shohin_bunrui
        ELSE NULL
    END AS abc_shohin_bunrui
FROM Shohin;

SELECT SUM(
        CASE
            WHEN shohin_bunrui = '衣服' THEN hanbai_tanka
            ELSE 0
        END
    ) AS sum_tanka_ihuku,
    SUM(
        CASE
            WHEN shohin_bunrui = 'キッチン用品' THEN hanbai_tanka
            ELSE 0
        END
    ) AS sum_tanka_kitchen,
    SUM(
        CASE
            WHEN shohin_bunrui = '事務用品' THEN hanbai_tanka
            ELSE 0
        END
    ) AS sum_tanka_jim
FROM Shohin;

-- 単純CASE
SELECT shohin_mei,
    CASE
        shohin_bunrui
        WHEN '衣服' THEN 'A:' || shohin_bunrui
        WHEN '事務用品' THEN 'B:' || shohin_bunrui
        WHEN 'キッチン用品' THEN 'C:' || shohin_bunrui
        ELSE NULL
    END AS abc_shohin_bunrui
FROM Shohin;