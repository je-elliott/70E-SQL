SELECT  r.*
FROM    [Rotation] r
WHERE   r.[Status] = 'Active'
AND     r.Id IN (
    SELECT RotationId FROM GloveSet WHERE [Location] = 'Service' GROUP BY RotationID Having Count(Id) > 1
)
AND     r.Id IN (
    SELECT RotationId FROM [Order] GROUP BY RotationId Having Count(Id) > 1 
)