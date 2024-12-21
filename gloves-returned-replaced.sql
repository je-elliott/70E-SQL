select  r.Id RotationId
        ,a.sourceId GloveSetId
        ,a.eventdatetime ReplacedDate
        ,gs.Name
        ,gs.Location
        ,r.Name

from [Audit] a
join GloveSet gs on gs.Id = a.SourceId
join Rotation r on r.Id = gs.RotationId
where TypeAudit = 'Gloveset'
and delta like '%to Replaced%'
order by 1, 2