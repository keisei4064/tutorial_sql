-- 5.1
CREATE VIEW ViewRenshu5_1 (shohin_mei, hanbai_tanka, torokubi) AS
SELECT shohin_mei,
    hanbai_tanka,
    torokubi
FROM Shohin
WHERE hanbai_tanka >= 1000
    AND torokubi = '2009-09-20';

-- 5.2
INSERT INTO ViewRenshu5_1
VALUES ('ナイフ', 300, '2009-11-02');

-- 5.3
SELECT shohin_id,
    shohin_mei,
    shohin_bunrui,
    hanbai_tanka,
    (
        SELECT AVG(hanbai_tanka)
        FROM Shohin
    ) AS hanbai_tanka_all
FROM Shohin
ORDER BY shohin_id;

-- 5.4
CREATE VIEW AvgTankaByBunrui (
    shohin_id,
    shohin_mei,
    shohin_bunrui,
    hanbai_tanka,
    avg_hanbai_tanka
) AS
SELECT shohin_id,
    shohin_mei,
    shohin_bunrui,
    hanbai_tanka,
    (
        SELECT AVG(hanbai_tanka)
        FROM Shohin AS S2
        WHERE S1.shohin_bunrui = S2.shohin_bunrui
    )
FROM Shohin AS S1;
