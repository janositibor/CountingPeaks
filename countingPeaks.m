function countingPeaks()
	%rng default % for reproducibility
	%rng % for random
	close all; %close all figures 
	%clear; %remove everything from workspace 
	clc;
	global aktual;
	global i;
	
	if exist('diary.txt', 'file')==2
		delete('diary.txt');
	end
	diary('diary.txt');	
	LinesToSkip=0;
	delimiterIn='\t';
	RAW_data_extension='*.dat';
	Direction='Negative';
	
	if exist('params.mat', 'file')==2
		load('params.mat');
	end

	prompt = {'Number of header rows:','Delimiter:','Extension:'};
	dlgtitle = 'Input parameters';
	dims = [1 35];
	definput = {num2str(LinesToSkip),delimiterIn,RAW_data_extension};
	
	disp('Please, define parameters for RAW data!');
	answer = inputdlg(prompt,dlgtitle,dims,definput);
	
	LinesToSkip=str2num(answer{1});
	delimiterIn=answer{2};
	RAW_data_extension=answer{3};
	

	
	
	disp(' ');
	disp('Please, define RAW data!');
	[file,path] = uigetfile(RAW_data_extension,'RAW data');
	if isequal(file,0)
		disp('No RAW file selected!');
	else
		FileTeljesUtesNev=fullfile(path,file);
		disp(['You selected: ', FileTeljesUtesNev]);
		OldDirection=Direction;
		disp(' ');
		disp('Choose peak direction!');
		Direction = questdlg('Choose peak direction!', 'What is the direction of peaks?','Negative','Positive',OldDirection);
		% Handle response
		
		if Direction=='Negative'
			disp('It will search for NEGATIVE peaks!');
		else
			disp('It will search for POSITIVE peaks!');
		end
		if LinesToSkip>0
			Beolvasott = importdata(FileTeljesUtesNev,delimiterIn,LinesToSkip);
			Input=Beolvasott.data;
		else
			Input = importdata(FileTeljesUtesNev,delimiterIn);
		end
		x_input=Input(:,1);
		y_input=Input(:,2);
		findpeaks_y_input=y_input;
		if Direction=='Negative'
			findpeaks_y_input=-1*y_input;
		end
		plot(x_input,y_input,'-b');
		disp(' ');
		disp('Please, define the file with previously found peaks!');
		disp('If you choose "Cancel" the program will search for them automatically.');
		[PreviousResultfile,PreviousResultpath] = uigetfile('*.txt','Previous RESULTS');
		if isequal(PreviousResultfile,0)
			%disp('User selected Cancel');
			[y_output,x_output] = findpeaks(findpeaks_y_input,x_input,'MinPeakProminence',10,'MinPeakDistance',6);
			if Direction=='Negative'
				y_output=-1*y_output;
			end
		
		else
			PreviousResultFileTeljesUtesNev=fullfile(PreviousResultpath,PreviousResultfile);
			%disp(['User selected ', FileTeljesUtesNev]);
			Input = importdata(PreviousResultFileTeljesUtesNev,delimiterIn);
			x_output=Input(:,1);
			y_output=Input(:,2);
		end
		y_output=transpose(y_output);
		x_output=transpose(x_output);
		hold on;
		i=1;
		jelolt_plotok=[plot(x_output,y_output,'-or')];
		aktual=plot(x_input(i),y_input(i),'o','MarkerFaceColor','red');
		disp(' ');
		disp('Now you can adjust the selected peaks!');
		disp('  - In order to add one press "SPACE"');
		disp('  - In order to remove press "DEL"');
		disp('  - You can use the magnification tools, available on the toolbar.');
		disp('  - Press "ESC" before you close the figure window!');
		set (gcf, 'WindowButtonMotionFcn', {@mouseMove,x_input, y_input});
		while 1
			k = waitforbuttonpress;
			if  k == 1                       % detects a key press
				button = double(get(gcf,'CurrentCharacter'));   % get keyboad ascii number
				if button==27 %ESCAPE
					break
				end
				if button==32 %SPACEBAR
					%add={'add:',x_input(i)}
					x_output=[x_output,x_input(i)];
					y_output=[y_output,y_input(i)];
					egyutt=transpose([x_output;y_output]);
					egyuttrendezve=transpose(sortrows(egyutt));
					x_output=egyuttrendezve(1,:);
					y_output=egyuttrendezve(2,:);
					delete(jelolt_plotok);
					jelolt_plotok=[jelolt_plotok,plot(x_output,y_output,'-or')];
				end
				if (button==8) %BACKSPACE
					x_output = x_output(1:end-1);
					y_output = y_output(1:end-1);
					delete(jelolt_plotok);
					jelolt_plotok=[plot(x_output,y_output,'-or')];
				end
				if (button==127) %DELETE
					meret=size(x_output);
					adathossz=meret(2);
					torlendo=binarySearch(x_output, adathossz, x_input(i));
					if(torlendo==adathossz)
						x_output = x_output(1:end-1);
						y_output = y_output(1:end-1);
					elseif(torlendo==1)
						x_output = x_output(2:end);
						y_output = y_output(2:end);
					else
						x_output = x_output([1:torlendo-1, torlendo+1:end]);
						y_output = y_output([1:torlendo-1, torlendo+1:end]);
					end
					delete(jelolt_plotok);
					jelolt_plotok=[plot(x_output,y_output,'-or')];
				end
			end
		end
		%x_output=x_output;
		%y_output=y_output;
		egyutt=[x_output;y_output];
		[folder, baseFileName, extension] = fileparts(FileTeljesUtesNev);
		Output_Nev_Uttal=strcat(path,'output_',baseFileName,'.txt');
		fileID = fopen(Output_Nev_Uttal,'w');
		fprintf(fileID,'%4.4f\t%4.4f\n',egyutt);
		fclose(fileID);
		disp(' ');
		disp(['Selected peaks were written into: ', Output_Nev_Uttal,' !']);
	end
	save('params.mat','LinesToSkip','delimiterIn','RAW_data_extension','Direction');
	diary off;