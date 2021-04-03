# The main structure of this file is this:

# objective: dependencies
# 	instructions

# Variables.

CXX = g++

BINARY = output.exe
SOURCES = $(wildcard *.cpp)
OBJECTS = $(SOURCES:.cpp=.o)

CPPFLAGS = -Wall -Wextra -Werror \
-pedantic-errors -std=c++20

# Entry.

all: $(BINARY)

# This rule compiles the main program. It depends on object files.

$(BINARY): $(OBJECTS)
	$(CXX) $? -o $@

# Each object file depends on its source files.
# $< Takes the first element (file name)
# $? Takes all the element
# $@ Takes the name of the objective (objective)

%.o: %.cpp %.h
	$(CXX) -c $< $(CPPFLAGS) -o $@

# Just cleaning the output files.

clean:
	del $(OBJECTS) $(BINARY) *~
