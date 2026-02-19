{ Unidad para asignatura con evaluación final }
unit uAsignaturaEvalFinal;

interface
uses uPersona;

const
  MAX_ALUMNOS = 30;

type
  TAsignatura = record
    Profesor: PPersona;
    Alumnos: array[1..MAX_ALUMNOS] of PPersona;
    Notas: array[1..MAX_ALUMNOS] of Real;
    NumAlumnos: Integer;
  end;

procedure InicializarAsignatura(var A: TAsignatura; Prof: PPersona);
procedure AnadirAlumno(var A: TAsignatura; Alumno: PPersona);
procedure Evaluar(var A: TAsignatura; AlumnoDNI: string; Nota: Real);
function CalcularNotaFinal(A: TAsignatura; AlumnoDNI: string): Real;

implementation

function BuscarAlumno(A: TAsignatura; AlumnoDNI: string): Integer;
var
  i: Integer;
begin
    BuscarAlumno := 0;
    i := 1;
    while (i <= A.NumAlumnos) and (A.Alumnos[i]^.DNI <> AlumnoDNI) do
        Inc(i);
    if i > A.NumAlumnos then
        i := -1;
    BuscarAlumno := i;
end;

procedure InicializarAsignatura(var A: TAsignatura; Prof: PPersona);
begin
  A.Profesor := Prof;
  A.NumAlumnos := 0;
end;

procedure AnadirAlumno(var A: TAsignatura; Alumno: PPersona);
begin
  AnadirAlumno := False;
  if A.NumAlumnos < MAX_ALUMNOS then
  begin
    Inc(A.NumAlumnos);
    A.Alumnos[A.NumAlumnos] := Alumno;
    A.Notas[A.NumAlumnos] := 0;
    AnadirAlumno := True;
  end;
end;

procedure Evaluar(var A: TAsignatura; AlumnoDNI: string; Nota: Real);
var
  i: Integer;
begin
    i := BuscarAlumno(A, AlumnoDNI);
    if i > 0 then
        A.Notas[i] := Nota;
end;

function CalcularNotaFinal(A: TAsignatura; AlumnoDNI: string): Real;
var
  i: Integer;
  notaFinal: Real;
begin
    i := BuscarAlumno(A, AlumnoDNI);
    if i > 0 then
        notaFinal := A.Notas[i]
    else
        notaFinal := 0.0;
    CalcularNotaFinal := notaFinal;
end;

end.