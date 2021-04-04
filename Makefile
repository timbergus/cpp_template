# The main structure of this file is this:

# target: prerequisites
# [tab]recipe

# Variables.

CXX = g++

INCDIR = inc

TARGET = output.exe
SOURCES = $(wildcard *.cpp)
OBJECTS = $(SOURCES:.cpp=.o)
SRCDIR = .

CPPFLAGS = -Wall -Wextra -Werror -pedantic-errors \
-std=c++20 -I $(INCDIR)

# Entry.

all: $(TARGET)

# This rule compiles the main program. It depends on object files.

$(TARGET): $(OBJECTS)
	$(CXX) $? -o $@

# Each object file depends on its source files.
# $< Takes the source file name.
# $? Takes all the element.
# $@ Takes the target's name.

#$@: $<
%.o: %.cpp
	$(CXX) -c -MD $(CPPFLAGS) $< -o $@

-include *.d

# Just cleaning the output files.

.PHONY: clean

clean:
	del $(OBJECTS) $(TARGET) *.d *~
