create user administrator identified by 'administrator';
create user Chris_tsaf identified by '123456789';
create user Eleonorahatzi identified by 'eleonora1234';
create user Pavlos64 identified by '12345';
create user Vasilias92 identified by 'kingkostas';
create user Nik_thequick identified by 'panathinaikos';
create user agiosgeorgios identified by '1234olympiakos';

grant all
on excursiondb.*
to admininstrator;

grant select, insert, update, delete
on excursiondb.hikingclub 
to Chris_tsaf, Eleonorahatzi; 

grant select, insert, update, delete
on excursiondb.hikingclub_has_user
to Chris_tsaf, Eleonorahatzi; 

grant select, insert, update, delete
on excursiondb.hikingclub_organize_trail
to Chris_tsaf, Eleonorahatzi; 

grant select, insert, update, delete
on excursiondb.image
to Chris_tsaf, Eleonorahatzi; 

grant select, insert, update, delete
on excursiondb.mountain
to Chris_tsaf, Eleonorahatzi; 

grant select, insert, update, delete
on excursiondb.pointofinterest
to Chris_tsaf, Eleonorahatzi; 

grant select, insert, update, delete
on excursiondb.river
to Chris_tsaf, Eleonorahatzi; 

grant select, insert, update, delete
on excursiondb.trail
to Chris_tsaf, Eleonorahatzi; 

grant select, insert, update, delete
on excursiondb.trail_has_mountain
to Chris_tsaf, Eleonorahatzi; 

grant select, insert, update, delete
on excursiondb.trail_has_pointofinterest
to Chris_tsaf, Eleonorahatzi; 

grant select, insert, update, delete
on excursiondb.trail_has_river
to Chris_tsaf, Eleonorahatzi; 

grant select, insert
on excursiondb.user_review_trail
to Chris_tsaf, Eleonorahatzi; 

grant select, insert, update
on excursiondb.trail 
to Pavlos64, Vasilias92, Nik_thequick, agiosgeorgios; 

grant select, insert, update
on excursiondb.trail_has_mountain 
to Pavlos64, Vasilias92, Nik_thequick, agiosgeorgios; 

grant select, insert, update
on excursiondb.trail_has_river 
to Pavlos64, Vasilias92, Nik_thequick, agiosgeorgios; 

grant select, insert, update
on excursiondb.trail_has_pointofinterest
to Pavlos64, Vasilias92, Nik_thequick, agiosgeorgios; 

grant select, insert
on excursiondb.user_review_trail
to Pavlos64, Vasilias92, Nik_thequick, agiosgeorgios; 

grant select, insert, update
on excursiondb.image
to Pavlos64, Vasilias92, Nik_thequick, agiosgeorgios; 

grant select
on excursiondb.hikingclub
to Pavlos64, Vasilias92, Nik_thequick, agiosgeorgios; 

grant select
on excursiondb.hikingclub_has_user
to Pavlos64, Vasilias92, Nik_thequick, agiosgeorgios; 

grant select
on excursiondb.hikingclub_organize_trail
to Pavlos64, Vasilias92, Nik_thequick, agiosgeorgios; 

grant select
on excursiondb.mountain
to Pavlos64, Vasilias92, Nik_thequick, agiosgeorgios; 

grant select, insert, update
on excursiondb.pointofinterest
to Pavlos64, Vasilias92, Nik_thequick, agiosgeorgios; 

grant select
on excursiondb.river
to Pavlos64, Vasilias92, Nik_thequick, agiosgeorgios; 
