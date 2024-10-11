-- Смотрим репорты каждого из подозреваемых
select distinct e.id as employee_id, e.name, e.surname , e.status, er.report, s.status from pc 
inner join security_journal sj on sj.discovery_date='2024-10-10' and sj.vlan=pc.vlan_pc and sj.vulnerability_id='УБИ.041'
inner join employees e on pc.id=e.pc
inner join statuses s on s.id=e.status
inner join applications a on a.source_pc=pc.id and a.application='Mozila Firefox' and a.session_time='17:25'
inner join employee_report er on er.uid_employee=e.uid;


-- Агафон check -> pass
select e.name, e.id, s.status from employees e 
inner join statuses s on s.id=e.status
where e.name='Алиса' and e.surname='Абрамович' or e.name='Натан' and e.surname='Христинович'

-- Дионисия check -> pass
select e.name, e.id, s.status from employees e 
inner join statuses s on s.id=e.status
where e.name='Август';

-- Дмитрий check -> fail
select e.name, e.id, s.status from employees e 
inner join statuses s on s.id=e.status
where e.name='Диана' and e.surname='Требияни';

-- answer
select e.name, e.surname, pc.ip_address from employees e 
inner join pc on e.pc=pc.id
where e.name='Дмитрий' and e.surname='Лесных';
