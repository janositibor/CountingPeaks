# CountingPeaks
Matlab script for counting peaks in electrophysiological recording


01. Run the script countingPeaks.m in Matlab
02. Define basic parameters for the input file

![Input fields to define params](/info/01-DefineParams.png)

03. Browse input file to process

![Browse input file](/info/02-ChooseInputFile.png)

04. Define the direction of peaks

![Define peaks direction](/info/03-DefinePeaksDirection.png)

05. Browse for previous results/output

![Browse previous results](/info/04-ChoosePreviousOutputFile.png)

With this option you can continue previous session.
If you push "Cancel" automatic peak detection will be carried out.

05. The figure shows the raw data and the peaks found

![Peaks found](/info/05-FoundPeaks.png)

06. You can find the Zoom In and Zoom Out tool to find the proper magnification

![Zoom In](/info/06-ZoomIn.png)

07. With the Pan tool you can scroll the data

![Pan](/info/07-Pan.png)

08. Add peak:
Place the red indicator on the peak (by moving the cursor) and press the "Space" button. 

09. Remove peak:
Place the red indicator in the peak's neighbourhood and press the "Delete" button. 

10. Save result by pressing "Esc" button.
The output file will be saved into the same directory and the name will be "output_TheNameOfTheInputFile.txt"

11. After saving you can close the figure.