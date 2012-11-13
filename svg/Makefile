# Common tools
ECHO=echo
RM=rm -rf
MV=mv
MKDIR=mkdir
CXX=g++

CROSS_COMPILE:=

# Define directories and source files
POLY_DIR:=$(CURDIR)/sources
BINDIR:=$(CURDIR)/bin
OBJDIR:=$(CURDIR)/objs
DOCSDIR:=$(CURDIR)/docs
AUTODIRS:=$(BINDIR) $(OBJDIR) $(DOCSDIR)
LIBSVG_DIR:=$(CURDIR)/libsvg2

# include directories
CPPFLAGS:=$(CPPFLAGS) -I/usr/include/libxml2 -I$(LIBSVG_DIR)/include

# Linker options
LDFLAGS:=-L$(LIBSVG_DIR)/bin -lxml2

# Adds flags to CPPFLAGS
ifdef NDEBUG
CPPFLAGS:=$(CPPFLAGS) -Wall -Wextra -Wconversion -O3 -DNDEBUG
else
CPPFLAGS:=$(CPPFLAGS) -Wall -Wextra -Wconversion -O0 -g -rdynamic
endif

export

.PHONY: all help poly docs clean mrproper directories directories_pre directories_post

all: directories poly

poly: $(LIBSVG_DIR)/libsvg2.a
	@$(MAKE) -C $(POLY_DIR)

$(LIBSVG_DIR)/libsvg2.a:
	@$(MAKE) NDEBUG=1 -C $(LIBSVG_DIR) libsvg2

clean:
	@$(MAKE) -C $(POLY_DIR) $@
	@$(MAKE) -C $(LIBSVG_DIR) $@

mrproper:
	@$(MAKE) -C $(POLY_DIR) $@
	@$(MAKE) -C $(LIBSVG_DIR) $@
	-@$(RM) $(BINDIR)
	-@$(RM) $(OBJDIR)
	-@$(RM) $(DOCSDIR)

directories: directories_pre $(AUTODIRS) directories_post

directories_pre:
	@$(ECHO) -- Checking directories --

directories_post:
	@$(ECHO) -- directories done --

$(AUTODIRS):
	@$(ECHO) -n $(PROMPT)
	$(MKDIR) -p $@

docs:
	@$(DOXY) ./poly.doxyfile

help:
	@$(ECHO) "Rules"
	@$(ECHO) "-----"
	@$(ECHO) "all       Build all rules but documentation."
	@$(ECHO) "clean     Delete objects files."
	@$(ECHO) "docs      Build documentation."
	@$(ECHO) "libsvg2   Compile libsvg2 library."
	@$(ECHO) "poly      Compile poly executable."
	@$(ECHO) "help      Display this page."
	@$(ECHO) "mrproper  Perform a clean and delete binary files as well."
	@$(ECHO) ""
	@$(ECHO) "Variables"
	@$(ECHO) "---------"
	@$(ECHO) "CROSS_COMPILE  Compiler prefix. (eg. sh4-linux-)."

