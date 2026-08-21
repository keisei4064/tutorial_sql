-- 6.1
SELECT shohin_mei,
    shiire_tanka
FROM Shohin
WHERE shiire_tanka NOT IN (500, 2800, 5000);

SELECT shohin_mei,
    shiire_tanka
FROM Shohin
WHERE shiire_tanka NOT IN (500, 2800, 5000, NULL);

-- 6.2
SELECT SUM(
        CASE
            WHEN hanbai_tanka <= 1000 THEN 1
            ELSE 0
        END
    ) AS low_price,
    SUM(
        CASE
            -- WHEN 1001 <= hanbai_tanka AND hanbai_tanka <= 3000 
            WHEN hanbai_tanka BETWEEN 1001 AND 3000 THEN 1
            ELSE 0
        END
    ) AS mid_price,
    SUM(
        CASE
            WHEN 3001 <= hanbai_tanka THEN 1
            ELSE 0
        END
    ) AS high_price
FROM Shohin;