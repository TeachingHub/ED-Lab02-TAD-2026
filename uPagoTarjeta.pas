unit uPagoTarjeta;

interface

procedure IniciarPago;
procedure RealizarPago(numeroTarjeta: string; monto: real);
function ValidarPago(numeroTarjeta: string): boolean;

implementation

procedure IniciarPago;
begin
  write('Introduce el número de tarjeta: ');
end;

procedure RealizarPago(numeroTarjeta: string; monto: real);
begin
  writeln('Realizando pago con tarjeta de ', monto:0:2, ' euros');
  writeln('Tarjeta: ', numeroTarjeta);
end;

function ValidarPago(numeroTarjeta: string): boolean;
begin
  ValidarPago := (length(numeroTarjeta) = 16);
end;

end.