% �������� � ����� ����: 
% f = 7*x^2 + 8*x*y + 3*y^2 + 8*x*z + 6*y*z + 3*z^2 + 6*x + y + 7

A = [7 4 4; 4 3 3; 4 3 3]; % ������� ������������ �����
a = [3 0.5 0]; % ������� ������ �������� �����
a0 = 7; % ��������� ����

% ������ �����, �� ������� ����� ������� ������
[x, y, z] = ndgrid(-10:0.1:10, -10:0.1:10, -10:0.1:10);

% ���������� �������� �����������
f = 7*x.^2 + 8*x.*y + 3*y.^2 + 8*x.*z + 6*y.*z + 3*z.^2 + 6*x + y + 7;
isosurface(f, 0);

% ���� �� � �� �������
display('�� � ��:')
[eig_vectors, eig_values] = eig(A)

% ��������� ����� �� �������
char_poly = poly(A);
display('������������������ ���������:')
polyout(char_poly, 'x')
display('��, ��������� �������:')
my_eig_values = roots(char_poly)

% ������� ��������� ��������
display('������� ��, ��������� ������� � ��� ������ eig():')
(abs(sort(eig(A))) - sort(my_eig_values)) <= 1e-5

% ������� S, ����������� ��� ���������� ����������� � ����� ���� ��������� � 
% �������� eig_vectors - ��� �� �������� �� ��������
S = eig_vectors;

% �������� ����� ����� ��� �������� ������
display('����� ������������ ��� �������� ������:')
a1 = transpose(S) * transpose(a)

% ������ ������������ ���
f_canon = eig_values(1, 1)*x.^2 + eig_values(2, 2)*y.^2 + eig_values(3, 3)*z.^2 + 2*a1(1)*x + 2*a1(2)*y + 2*a1(3)*z + a0;
figure;
isosurface(f_canon, 0);

% ��-��������, ����� ��� ������ ����� �������� ��� � ������ ���������, �������� ��� ���
% �� � ������ ��� ������� ������� ������������� (��������), ��� �� ���������