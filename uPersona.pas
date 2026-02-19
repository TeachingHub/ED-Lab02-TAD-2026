{ Unidad base para personas }
unit uPersona;

interface

type
  TRol = (rProfesor, rAlumno);
  
  TPersona = record
    Nombre: string;
    Apellido: string;
    DNI: string;
    FechaNacimiento: string;
    Rol: TRol;
  end;

  PPersona = ^TPersona;


procedure CrearPersona(var persona: TPersona; Nombre, Apellido, DNI, FechaNacimiento: String; Rol: TRol);
procedure MostrarPersona(P: TPersona);


implementation

procedure CrearPersona(var persona: TPersona; Nombre, Apellido, DNI, FechaNacimiento: String; Rol: TRol);
begin
  persona.Nombre := Nombre;
  persona.Apellido := Apellido;
  persona.DNI := DNI;
  persona.FechaNacimiento := FechaNacimiento;
  persona.Rol := Rol;
end;


procedure MostrarPersona(P: TPersona);
begin
  WriteLn('DNI: ', P.DNI);
  WriteLn('Nombre: ', P.Nombre, ' ', P.Apellido);
  WriteLn('Fecha Nacimiento: ', P.FechaNacimiento);
  if P.Rol = rProfesor then
    WriteLn('Rol: Profesor')
  else
    WriteLn('Rol: Alumno');
end;

end.