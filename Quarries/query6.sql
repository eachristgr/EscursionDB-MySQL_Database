SELECT trail.Name,hikingclub_organize_trail.Date,hikingclub_organize_trail.StartPoint,hikingclub.Name,hikingclub.Telephone

FROM 

(trail 
join hikingclub_organize_trail on ( trail.TrailID = hikingclub_organize_trail.Trail )
join hikingclub on ( hikingclub.HCID = hikingclub_organize_trail.HikingClub ))

WHERE TrailID=108
