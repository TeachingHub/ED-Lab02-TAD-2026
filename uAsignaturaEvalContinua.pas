{ Unidad para asignatura con evaluación continua }
unit uAsignaturaEvalContinua;

interface
uses uPersona;

const
  MAX_ALUMNOS = 30;

type
  TAsignatura = record
    Profesor: PPersona;
    Alumnos: array[1..MAX_ALUMNOS] of PPersona;
    NotasPrimerParcial: array[1..MAX_ALUMNOS] of Real;
    NotasSegundoParcial: array[1..MAX_ALUMNOS] of Real;
    NumAlumnos: Integer;
  end;

procedure InicializarAsignatura(var A: TAsignatura; Prof: PPersona);
procedure AnadirAlumno(var A: TAsignatura; Alumno: PPersona);
procedure Evaluar(var A: TAsignatura; AlumnoDNI: string; Nota: Real; Parcial: Integer);
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
  if A.NumAlumnos < MAX_ALUMNOS then
  begin
    Inc(A.NumAlumnos);
    A.Alumnos[A.NumAlumnos] := Alumno;
    A.NotasPrimerParcial[A.NumAlumnos] := 0;
    A.NotasSegundoParcial[A.NumAlumnos] := 0;
  end;
  else
    writeln('No se pueden añadir más alumnos');
    
end;

procedure Evaluar(var A: TAsignatura; AlumnoDNI: string; Nota: Real; Parcial: Integer);
var
  i: Integer;
begin
    i := BuscarAlumno(A, AlumnoDNI);
    if i >= 0 then
      case Parcial of
        1: A.NotasPrimerParcial[i] := Nota;
        2: A.NotasSegundoParcial[i] := Nota;
      end;
end;

function CalcularNotaFinal(A: TAsignatura; AlumnoDNI: string): Real;
var
  i: Integer;
  NotaFinal: Real;
begin
    i := BuscarAlumno(A, AlumnoDNI);
    if i >= 0 then
        NotaFinal := (A.NotasPrimerParcial[i] + A.NotasSegundoParcial[i]) / 2;
    CalcularNotaFinal := NotaFinal;
end;



end.