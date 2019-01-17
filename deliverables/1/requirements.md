FUN-TEXT-DISPLAY - Upon startup, the system shall display a graphical user interface with three textboxes, labeled Program Area, Stack, and Output.  The Program Area textbox shall be user-editable; the other two will never be editable directly by the user.  


FUN-MENUS - There shall be three menu groups: File, Color, and Options.  Under File, there shall be four menu items: Open File, Save File, Save As, and Quit.  Under Color, there shall be six menu items: Red, Yellow, Blue, Pink, Green, and Orange.  Under Options, there shall be two checkable menu items: Time Program, and Check for End Opcode.

FUN-FILE-LOADING - Users shall be able to save their programs using the Save File and Save As functionality.  If a program has not been named yet (either by saving or loading from a previously-named file), then both shall act in the same manner, asking the user to select a name using a File Selection dialog; otherwise, Save File shall simply save the file to the already-selected file.  They may load a file into the GUI by selecting the Open File, at which point the data in the file shall be loaded into the Program Area and the name of the program changed to the name of the file opened.   At all points, the name of the program shall be displayed at the top of the GUI, or "UNTITLED" only if the the program has never been named or opened from a file.

FUN-BEFUNGE - The system shall be able to run any valid Befunge-93 program, displaying valid stack data and output according to the Befunge-93 specification here: http://catseye.tc/view/befunge-93/doc/Befunge-93.markdown

FUN-RUN-SPEED - The system shall have three standard execution speeds, Run (no pauses in execution), Walk (50 ms pause after each opcode), and Mosey (500 ms pause after each opcode).  All of these shall be reachable by pressing a button of the appropriate name.

FUN-STEP - The system shall allow the user to step one opcode at a time, appropriately updating the stack and output, by pressing the Step button.

FUN-STOP - When no program is being executed, the Stop button shall be disabled.  When a program is being executed, the Stop button shall be enabled.  Upon clicking the Stop button, the currently running program shall stop execution.

FUN-TIME - If the "Options..Time program" option is checked, then after program execution has completed, the system shall inform the user how long, in microseconds, the program took to execute.  If the "Options..Time Program" option is not checked, the user shall not be informed.

FUN-TRACE - If and only if a program is being executed, the system shall display a cursor on the current opcode indicating that is being executed.  This cursor should start displaying immediately after starting execution of a program on the first opcode, and will do so no matter if started via Run, Walk, Mosey, or Step.  It shall not appear when a program is not being executed.

PERF-EXECUTION-TIME - On any given computer, the system shall be able to complete execution of a reference FizzBuzz implementation (i.e., the one listed in the README.md file of the JBefunge repository), in less than 30 seconds (30,000,000 microseconds) using the "Run" command (as opposed to "Walk" or "Mosey"). 

