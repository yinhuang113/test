# Define directories
POLY_OBJDIR:=$(OBJDIR)/poly
AUTODIRS:=$(POLY_OBJDIR)

# Define source files and object files
CFILES:=${shell find ${CURDIR} -name "*.cpp" -print}
OFILES:=$(patsubst %.cpp,%.o,$(CFILES))
OFILES:=$(notdir $(OFILES))
OFILES:=$(addprefix $(POLY_OBJDIR)/,$(OFILES))
OUTFILES:=$(BINDIR)/poly
CPPFLAGS:=$(CPPFLAGS)
LDFLAGS:=-lsvg2 $(LDFLAGS) -L$(BINDIR)
# Define sub-directories
VPATH:=$(dir $(CFILES)) $(INCDIR)

.PHONY: all clean mrproper poly_pre poly_post directories directories_pre directories_post

all: directories poly_pre $(OUTFILES) poly_post

poly_pre:
	@$(ECHO) "-- Building poly --"

poly_post: $(OUTFILES)
	@$(ECHO) "-- poly done --"

$(POLY_OBJDIR)/%.o: %.cpp
	$(CROSS_COMPILE)$(CXX) $(CPPFLAGS) $(addprefix -I,$(INCDIR)) -c $< -o $@

$(POLY_OBJDIR)/poly.o: ../poly.cpp
	$(CROSS_COMPILE)$(CXX) $(CPPFLAGS) $(addprefix -I,$(INCDIR)) -c $< -o $@

$(BINDIR)/poly: $(OFILES) $(POLY_OBJDIR)/poly.o
	$(CROSS_COMPILE)$(CXX) $(OFILES) $(POLY_OBJDIR)/poly.o $(LDFLAGS) $(LIBSVG_DIR)/bin/libsvg2.a $(LIBGSIM_DIR)/lib/libgsimtripath.a -o $@

clean:
	@$(RM) $(POLY_OBJDIR)

mrproper: clean
	@$(RM) $(OUTFILES)

directories: directories_pre $(AUTODIRS) directories_post

directories_pre:
	@$(ECHO) -- Checking directories --

directories_post:
	@$(ECHO) -- directories done --

$(AUTODIRS):
	@$(ECHO) -n $(PROMPT)
	$(MKDIR) -p $@
