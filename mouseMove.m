function mouseMove (object, eventdata, x_input, y_input)
	global aktual;
	global i;
	
	meret=size(x_input);
	adathossz=meret(1);
	C = get (gca, 'CurrentPoint');
	CursorX=C(1,1);
	index=binarySearch(x_input, adathossz, CursorX);
	
	aktual.XData = x_input(index);
    aktual.YData = y_input(index);
	i=index;
    drawnow
	title(gca, ['(X,Y) = (', num2str(C(1,1)), ', ',num2str(C(1,2)), ')']);
	title(['(n,X,Y) = (', num2str(index),', ', num2str(x_input(index)), ', ',num2str(y_input(index)), ')']);
	
	