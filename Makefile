PATH := C:\mingw\bin;$(PATH)

# To compile and run directly just type 'make' or 'mingw32-make' in the terminal
all: compile-dynamic run-dynamic


# To compile the source code into dynamic and static executables
compile: compile-dynamic compile-static



compile-dynamic:
	C:\mingw\bin\g++.exe src\main.cpp -o bin\dynamic\main.exe -g -Ideps\include -Ldeps\lib -lbgi -lgdi32 -lcomdlg32 -luuid -loleaut32 -lole32 -mwindows

compile-static:
	C:\mingw\bin\g++.exe src\main.cpp -o bin\static\main.exe -g -Ideps\include -Ldeps\lib -lbgi -lgdi32 -lcomdlg32 -luuid -loleaut32 -lole32 -mwindows -static


# To run the compiled executables
run-dynamic:
	bin\dynamic\main.exe

run-static:
	bin\static\main.exe


# To clean up the build artifacts
clean: clean-dynamic clean-static

clean-static:
	del bin\static\main.exe

clean-dynamic:
	del bin\dynamic\main.exe



# set the icon for the executable
set-icon:
	deps\icon\img2obj.bat
	C:\mingw\bin\g++.exe src\main.cpp deps\icon\image.o -o bin\dynamic\main.exe -g -Ideps\include -Ldeps\lib -lbgi -lgdi32 -lcomdlg32 -luuid -loleaut32 -lole32 -mwindows
	C:\mingw\bin\g++.exe src\main.cpp deps\icon\image.o -o bin\static\main.exe -g -Ideps\include -Ldeps\lib -lbgi -lgdi32 -lcomdlg32 -luuid -loleaut32 -lole32 -mwindows -static
