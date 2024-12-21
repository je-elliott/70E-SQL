select 
    b.created Returned, b.contents, b.rotationid, x.[name]
from batch b
    join rotation x on b.RotationId = x.Id
where b.rotationid in (
    select r.Id RotationId
    from [Audit] a
        join GloveSet gs on gs.Id = a.SourceId
        join Rotation r on r.Id = gs.RotationId
    where TypeAudit = 'Gloveset'
        and delta like '%to Replaced%'
) and b.created < (
    select top 1
        a.eventdatetime
    from [Audit] a
        join GloveSet gs on gs.Id = a.SourceId
        join Rotation r on r.Id = gs.RotationId
    where TypeAudit = 'Gloveset'
        and delta like '%to Replaced%'
        and r.id = b.rotationid
    order by a.id desc
)
order by b.rotationid, b.created
