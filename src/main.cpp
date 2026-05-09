#include <graphics.h>
#include <conio.h>

int main() {

    // Define window dimensions
    int windowWidth = 1024;
    int windowHeight = 768;
    
    // Calculate centered position
    int xPos = (getmaxwidth() - windowWidth) / 2;
    int yPos = (getmaxheight() - windowHeight) / 2;
    
    // Initialize graphics window at center of screen
    initwindow(windowWidth, windowHeight, "Hello World - WinBGI Graphics", xPos, yPos, false, true);

    
    // Set background color
    setbkcolor(WHITE);
    cleardevice();
    
    // Set text style for "Hello World"
    setcolor(BLACK);
    settextstyle(DEFAULT_FONT, HORIZ_DIR, 60);
    
    // Get text width for centering
    int textX = windowWidth / 2;
    int textY = windowHeight / 2;
    
    // Display "Hello World" message at centered position
    outtextxy(textX - 150, textY - 30, (char*)"Hello World!");

    // Display exit instruction
    setcolor(RED);
    outtextxy(windowWidth / 2 - 100, windowHeight - 50, (char*)"Press any key to exit...");
    
    // Wait for user input
    getch();
    
    // Close graphics window
    closegraph();
    
    return 0;
}
