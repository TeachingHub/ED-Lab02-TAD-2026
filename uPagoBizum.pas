unit uPagoBizum;

interface

procedure IniciarPago;
procedure RealizarPago(numeroTelefono: string; monto: real);
function ValidarPago(numeroTelefono: string): boolean;

implementation

procedure IniciarPago;
begin
  write('Introduce el número de teléfono para Bizum: ');
end;

procedure RealizarPago(numeroTelefono: string; monto: real);
begin
  writeln('Realizando pago por Bizum de ', monto:0:2, ' euros al número ', numeroTelefono);
end;

function ValidarPago(numeroTelefono: string): boolean;
begin
  ValidarPago := (length(numeroTelefono) = 9);
end;

end.