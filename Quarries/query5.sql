SELECT mountain.Name,mountain.Description,river.Name ,river.Description
FROM mountain JOIN river 
WHERE mountain.Region ='Epirus' AND river.Region = 'Epirus'