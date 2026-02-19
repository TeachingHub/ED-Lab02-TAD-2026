unit uPagoTransferencia;

interface

procedure IniciarPago;
procedure RealizarPago(numeroCuenta: string; monto: real);
function ValidarPago(numeroCuenta: string): boolean;

implementation

procedure IniciarPago;
begin
  write('Introduce el número de cuenta IBAN: ');
end;

procedure RealizarPago(numeroCuenta: string; monto: real);
begin
  writeln('Realizando transferencia de ', monto:0:2, ' euros a la cuenta ', numeroCuenta);
end;

function ValidarPago(numeroCuenta: string): boolean;
begin
  ValidarPago := (length(numeroCuenta) = 24);
end;

end.
