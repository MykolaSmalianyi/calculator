# Задання параметрів
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -fPIC
LDFLAGS = -L. -lcalculator
LIBRARY_NAME = libcalculator.so
EXECUTABLE = calculator_app

all: $(LIBRARY_NAME) $(EXECUTABLE)

# Створення динамічної бібліотеки
$(LIBRARY_NAME): calculator.o
	$(CXX) -shared -o $(LIBRARY_NAME) calculator.o

calculator.o: calculator.cpp calculator.h
	$(CXX) $(CXXFLAGS) -c calculator.cpp

# Лінкування виконуваного файлу з динамічною бібліотекою
$(EXECUTABLE): main.o $(LIBRARY_NAME)
	$(CXX) $(CXXFLAGS) -o $(EXECUTABLE) main.o $(LDFLAGS)

main.o: main.cpp
	$(CXX) $(CXXFLAGS) -c main.cpp

clean:
	rm -f *.o $(EXECUTABLE) $(LIBRARY_NAME)

# Запуск виконуваного файлу

run: $(EXECUTABLE)
	LD_LIBRARY_PATH=. ./$(EXECUTABLE)

.PHONY: all clean run
