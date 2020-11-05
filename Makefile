TARGET   = mqtt_client

CC       = gcc
CFLAGS   = -std=gnu99 -Wall -Wextra -g -DLOG_USE_COLOR

LINKER   = gcc
LFLAGS   =

SRCDIR   = src
OBJDIR   = obj
BINDIR   = bin

SOURCES  := $(wildcard $(SRCDIR)/*.c)
INCLUDES := $(wildcard $(SRCDIR)/*.h)
OBJECTS  := $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

LIBRARIES= -lpaho-mqtt3c -lpaho-mqtt3a

$(BINDIR)/$(TARGET): $(OBJECTS)
	$(LINKER) $(LIBRARIES) $(OBJECTS) $(LFLAGS) -o $@

$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJECTS)
	$(RM) $(BINDIR)/$(TARGET)
