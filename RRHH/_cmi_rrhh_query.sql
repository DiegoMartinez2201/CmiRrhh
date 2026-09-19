SET NOCOUNT ON;
USE [CMI];
SELECT 'COUNTS' AS section, o.type_desc, COUNT(*) AS cnt
FROM sys.objects o
WHERE o.is_ms_shipped=0 AND (
  o.name LIKE N'%Usuario%' OR o.name LIKE N'%Empleado%' OR o.name LIKE N'%Asistencia%'
  OR o.name LIKE N'%Permiso%' OR o.name LIKE N'%Rol%' OR o.name LIKE N'spRRHH_%'
  OR o.name LIKE N'spSEG_%' OR o.name LIKE N'%RRHH%' OR o.name LIKE N'%SEG_%'
)
GROUP BY o.type_desc ORDER BY o.type_desc;
SELECT 'TABLES' AS section, o.name FROM sys.objects o WHERE o.is_ms_shipped=0 AND o.type='U' AND (
  o.name LIKE N'%Usuario%' OR o.name LIKE N'%Empleado%' OR o.name LIKE N'%Asistencia%'
  OR o.name LIKE N'%Permiso%' OR o.name LIKE N'%Rol%' OR o.name LIKE N'%RRHH%' OR o.name LIKE N'%SEG_%'
) ORDER BY o.name;
SELECT 'PROCS_RRHH_SEG' AS section, o.name FROM sys.objects o WHERE o.is_ms_shipped=0 AND o.type='P' AND (o.name LIKE N'spRRHH_%' OR o.name LIKE N'SpRRHH_%' OR o.name LIKE N'spSEG_%' OR o.name LIKE N'SP_Seguridad%') ORDER BY o.name;
SELECT 'VIEWS' AS section, o.name FROM sys.objects o WHERE o.is_ms_shipped=0 AND o.type='V' AND (o.name LIKE N'%Usuario%' OR o.name LIKE N'%Empleado%' OR o.name LIKE N'%Asistencia%' OR o.name LIKE N'%Permiso%' OR o.name LIKE N'%Rol%' OR o.name LIKE N'%RRHH%') ORDER BY o.name;
SELECT 'TRIGGERS' AS section, o.name FROM sys.objects o WHERE o.is_ms_shipped=0 AND o.type='TR' AND (o.name LIKE N'%permiso%' OR o.name LIKE N'%Asistencia%' OR o.name LIKE N'%Empleado%' OR o.name LIKE N'%Usuario%' OR o.name LIKE N'%RRHH%') ORDER BY o.name;
SELECT 'TOTAL_OBJECTS' AS section, type_desc, COUNT(*) cnt FROM sys.objects WHERE is_ms_shipped=0 GROUP BY type_desc ORDER BY type_desc;
